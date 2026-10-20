import asyncio
from contextvars import ContextVar

request_id = ContextVar("request_id", default="-")


async def handle(rid):
    request_id.set(rid)
    await asyncio.sleep(0.01)
    return f"handled in context {request_id.get()}"


async def main():
    results = await asyncio.gather(*(handle(f"req-{i}") for i in range(3)))
    print(results)
    print("outer:", request_id.get())


if __name__ == "__main__":
    asyncio.run(main())
