# server.py
# ---------------------------------------------------------------------------
# This is the backend. It does three jobs:
#   1. Serve the chat webpage (everything in static/).
#   2. Handle login, so the app knows WHO is chatting (the "userid").
#   3. Handle /chat: take a prompt from the browser and forward it to the
#      right model backend (a val.town endpoint that runs your .pt model).
# ---------------------------------------------------------------------------

import json
from pathlib import Path

from fastapi import FastAPI, HTTPException
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
import httpx

app = FastAPI()

# BASE = the folder this file lives in. We use it so the app finds
# models.json / ollama.json / auth.json no matter where it's launched from.
BASE = Path(__file__).parent

# ---------------------------------------------------------------------------
# Load configuration files at startup.
# ---------------------------------------------------------------------------

# models.json  -> local .pt model files you have on disk, e.g.
#   { "example-1": "/models/example-1/v010.pt" }
# Currently local generation is NOT wired up (see the /chat function below).
models = json.loads((BASE / "models.json").read_text())

# ollama.json -> remote model backends, keyed by the model name shown in the
# dropdown, value = the base URL of a val.town endpoint that runs that model.
# e.g. { "llama3.2": "https://xxxx.web.val.run/" }
ollama = json.loads((BASE / "ollama.json").read_text())

# auth.json -> the list of valid users, e.g.
#   { "users": { "yucheng": "example-psw" } }
# We keep this simple: username + password, checked on /login.
auth_data = json.loads((BASE / "auth.json").read_text())
USERS = auth_data["users"]

# In-memory "who is logged in" store. Since this is a small personal app we
# don't bother with real sessions/cookies — the browser just remembers the
# userid after a successful login and sends it back on every /chat call.
# (Restarting the server forgets nothing here, because we don't need a
# secret token — we just re-check username/password isn't required again;
# the browser re-sends the userid each time.)


# ---------------------------------------------------------------------------
# Request bodies. Pydantic validates these automatically — if the browser
# sends the wrong shape of JSON, FastAPI rejects it before our code runs.
# ---------------------------------------------------------------------------

class LoginRequest(BaseModel):
    username: str
    password: str


class ChatRequest(BaseModel):
    model: str      # which model the user picked in the dropdown
    prompt: str     # what the user typed
    userid: str      # who is asking (comes back from /login)


# ---------------------------------------------------------------------------
# Routes
# ---------------------------------------------------------------------------

@app.post("/login")
def login(req: LoginRequest):
    """
    Check username/password against auth.json.
    On success, just return the username back — the browser will use it
    as the 'userid' on every future /chat request.
    On failure, return a 401 so the browser can show an error.
    """
    correct_password = USERS.get(req.username)
    if correct_password is None or correct_password != req.password:
        raise HTTPException(status_code=401, detail="Wrong username or password")
    return {"userid": req.username}


@app.get("/models")
def list_models():
    """
    Tell the browser which models exist, so it can fill the dropdown.
    We only ever send the NAMES, never the file paths or URLs — those stay
    secret on the server.
    """
    return {"local": list(models.keys()), "remote": list(ollama.keys())}


@app.post("/chat")
async def chat(req: ChatRequest):
    """
    Take {model, prompt, userid} from the browser and get a reply.

    - If the model is in ollama.json, it's a REMOTE model: we call the
      val.town endpoint with the prompt and the userid, and pass back
      whatever text it returns.
    - If the model is in models.json, it's a LOCAL .pt model: this is not
      wired up yet (would need to call your nanoGPT sample.py here).
    - Otherwise the model name isn't recognized.
    """

    # Reject requests from people who never logged in successfully.
    if req.userid not in USERS:
        raise HTTPException(status_code=401, detail="Not logged in")

    if req.model in ollama:
        base_url = ollama[req.model].rstrip("/")

        # Your val.town endpoints expect:
        #   GET <base_url>/generate?p=<prompt>&userid=<userid>
        try:
            async with httpx.AsyncClient(timeout=60) as client:
                r = await client.get(
                    f"{base_url}/generate",
                    params={"p": req.prompt, "userid": req.userid},
                )
                r.raise_for_status()  # raise an error if val.town returned 4xx/5xx
                return {"response": r.text}
        except httpx.HTTPError as e:
            # Network problem, timeout, or val.town returned an error status.
            # We catch it here so the whole server doesn't crash — the
            # browser just sees a readable error message instead.
            return {"error": f"Could not reach model backend: {e}"}

    elif req.model in models:
        # TODO: hook up real local generation here, e.g. call your
        # nanoGPT sample.py with models[req.model] as the checkpoint path.
        return {"response": f"[local model '{req.model}' generation not wired up yet]"}

    else:
        return {"error": "unknown model"}


# ---------------------------------------------------------------------------
# Serve the frontend. This must be LAST — FastAPI checks routes in order,
# and this mount would otherwise swallow /models, /chat, /login too.
# html=True means it automatically serves static/index.html at "/".
# ---------------------------------------------------------------------------
app.mount("/", StaticFiles(directory=BASE / "static", html=True), name="static")
