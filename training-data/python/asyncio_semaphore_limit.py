import asyncio


async def worker(i, sem):
    async with sem:
        await asyncio.sleep(0.01)
        return i


async def main():
    sem = asyncio.Semaphore(2)
    print(await asyncio.gather(*(worker(i, sem) for i in range(6))))


if __name__ == "__main__":
    asyncio.run(main())
