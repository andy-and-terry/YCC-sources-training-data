import asyncio


async def job(name):
    await asyncio.sleep(0.01)
    return name.upper()


async def main():
    async with asyncio.TaskGroup() as tg:
        tasks = [tg.create_task(job(n)) for n in ("a", "b", "c")]
    print([t.result() for t in tasks])


if __name__ == "__main__":
    asyncio.run(main())
