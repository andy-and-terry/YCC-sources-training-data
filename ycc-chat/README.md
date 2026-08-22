# YCC Chat

A tiny local chat UI backed by remote val.town model endpoints and/or local .pt models.

## Setup
```
pip install -r requirements.txt
```

## Fill in
- `auth.json`   -> under `"users"`, add `"username": "password"` for each person allowed to log in.
- `models.json` -> your local `.pt` model paths (local generation is still a stub in `server.py`).
- `ollama.json` -> real val.town endpoint base URL(s), one per model name, e.g.
  ```json
  { "llama3.2": "https://xxxx.web.val.run/" }
  ```

## Run
```
py -m uvicorn server:app --reload
```
Then open http://localhost:8000, log in, and chat.

## val.town (.ts) files to upload

For every entry in `ollama.json`, you need a val.town HTTP val (a `.ts` file) that exposes:

```
GET <your-val-url>/generate?p=<prompt>&userid=<userid>
```

- `p` — the user's prompt text (URL-encoded).
- `userid` — the logged-in username, so the val can do per-user logic (rate limiting, logging, picking a per-user model state, etc. — up to you).
- The val should return the model's reply as **plain text** in the response body (`server.py` currently just forwards `r.text` back to the browser as-is).

Once you've written and deployed the `.ts` val(s), send me the links and I'll:
1. Verify the request/response shape matches what `server.py` expects.
2. Update `ollama.json` with the real URLs.
3. Adjust `server.py` if your val's response format differs (e.g. if it returns JSON instead of plain text).

### Suggested minimal val.town template (for reference)
```ts
// val.town HTTP val — GET /generate?p=...&userid=...
export default async function (req: Request): Promise<Response> {
  const url = new URL(req.url);
  const prompt = url.searchParams.get("p") ?? "";
  const userid = url.searchParams.get("userid") ?? "anonymous";

  // TODO: call your model here (e.g. load nanoGPT checkpoint, run inference)
  const reply = `[stub reply to "${prompt}" for user ${userid}]`;

  return new Response(reply, { headers: { "content-type": "text/plain" } });
}
```
