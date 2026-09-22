"""contextvars.ContextVar: state that is local to the current logical
context (e.g. a request), safe to use across coroutines without
leaking between concurrently running tasks."""

import asyncio
from contextvars import ContextVar

request_id: ContextVar[str] = ContextVar("request_id", default="none")


def log(message: str) -> None:
    print(f"[{request_id.get()}] {message}")


async def handle_request(rid: str, delay: float) -> None:
    token = request_id.set(rid)
    try:
        log("started")
        await asyncio.sleep(delay)
        log("finished")
    finally:
        request_id.reset(token)


async def main() -> None:
    await asyncio.gather(
        handle_request("req-1", 0.02),
        handle_request("req-2", 0.01),
    )
    log("back in main context")


if __name__ == "__main__":
    asyncio.run(main())
