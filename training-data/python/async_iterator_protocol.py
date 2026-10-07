"""Hand-written async iterator (__aiter__/__anext__), consumed with
`async for`. Each step awaits real work, unlike a plain synchronous
iterator wrapped in a coroutine."""

import asyncio


class AsyncCountdown:
    def __init__(self, start: int, delay: float = 0.01):
        self.remaining = start
        self.delay = delay

    def __aiter__(self) -> "AsyncCountdown":
        return self

    async def __anext__(self) -> int:
        if self.remaining <= 0:
            raise StopAsyncIteration
        await asyncio.sleep(self.delay)
        current = self.remaining
        self.remaining -= 1
        return current


async def async_squares(limit: int, delay: float = 0.01):
    """An async generator -- built with `yield` inside an `async def`
    -- is a shorthand for writing __aiter__/__anext__ by hand."""
    for i in range(limit):
        await asyncio.sleep(delay)
        yield i * i


async def collect(aiterable) -> list:
    return [item async for item in aiterable]


async def main() -> None:
    countdown_values = []
    async for value in AsyncCountdown(5):
        countdown_values.append(value)
    print(countdown_values)

    squares = await collect(async_squares(5))
    print(squares)


if __name__ == "__main__":
    asyncio.run(main())
