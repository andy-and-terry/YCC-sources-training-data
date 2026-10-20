import asyncio


async def fetch(n, delay):
    await asyncio.sleep(delay)
    return n


async def main():
    print(await asyncio.gather(fetch(1, 0.01), fetch(2, 0.02)))
    try:
        await asyncio.wait_for(fetch(3, 1), timeout=0.05)
    except asyncio.TimeoutError:
        print("timed out")


if __name__ == "__main__":
    asyncio.run(main())
