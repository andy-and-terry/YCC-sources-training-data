"""Hand-written async context manager (__aenter__/__aexit__), used
with `async with`. Useful whenever entering or leaving a resource
requires awaiting something, such as an async lock or connection."""

import asyncio


class AsyncConnection:
    """Simulates acquiring and releasing a network connection, both of
    which take real (awaited) time."""

    def __init__(self, name: str):
        self.name = name
        self.open = False

    async def __aenter__(self) -> "AsyncConnection":
        await asyncio.sleep(0.01)
        self.open = True
        print(f"{self.name}: connected")
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb) -> bool:
        await asyncio.sleep(0.01)
        self.open = False
        print(f"{self.name}: disconnected")
        return False  # propagate exceptions

    async def query(self, sql: str) -> str:
        if not self.open:
            raise RuntimeError("connection is not open")
        return f"result of '{sql}' on {self.name}"


async def run_query(name: str, sql: str) -> str:
    async with AsyncConnection(name) as conn:
        return await conn.query(sql)


async def main() -> None:
    result = await run_query("primary-db", "SELECT 1")
    print(result)

    try:
        async with AsyncConnection("replica-db") as conn:
            raise ValueError("query failed")
    except ValueError as e:
        print(f"caught after cleanup: {e}")
        print("connection still open?", conn.open)


if __name__ == "__main__":
    asyncio.run(main())
