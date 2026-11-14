import asyncio


async def worker(i: int, sem: asyncio.Semaphore) -> int:
    async with sem:
        await asyncio.sleep(0.01)
        return i * i


async def main() -> None:
    sem = asyncio.Semaphore(3)
    results = await asyncio.gather(*(worker(i, sem) for i in range(8)))
    print(results)


if __name__ == "__main__":
    asyncio.run(main())
