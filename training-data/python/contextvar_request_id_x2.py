from contextvars import ContextVar

rid: ContextVar[str] = ContextVar("rid", default="-")

def log(m): print(f"[{rid.get()}] {m}")

tok = rid.set("r-7")
log("inside")
rid.reset(tok)
log("outside")
