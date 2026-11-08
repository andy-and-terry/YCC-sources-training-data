import asyncio
import contextvars

request_id = contextvars.ContextVar("request_id", default="-")


def log(msg):
    print(f"[{request_id.get()}] {msg}")


async def handle(rid):
    request_id.set(rid)
    await asyncio.sleep(0.01)
    log("handled")


async def main():
    await asyncio.gather(handle("a1"), handle("b2"), handle("c3"))
    log("outside tasks")


if __name__ == "__main__":
    asyncio.run(main())
