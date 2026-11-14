import contextvars

request_id = contextvars.ContextVar("request_id", default="-")


def log(msg: str) -> None:
    print(f"[{request_id.get()}] {msg}")


def handle(rid: str) -> None:
    token = request_id.set(rid)
    try:
        log("handling")
    finally:
        request_id.reset(token)


if __name__ == "__main__":
    handle("abc123")
    log("outside")
