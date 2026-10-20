import asyncio


async def fetch(name, delay, fail=False):
    await asyncio.sleep(delay)
    if fail:
        raise ValueError(f"{name} failed")
    return f"{name} done"


async def main():
    async with asyncio.TaskGroup() as tg:
        t1 = tg.create_task(fetch("a", 0.01))
        t2 = tg.create_task(fetch("b", 0.02))
    print(t1.result(), t2.result())

    try:
        async with asyncio.TaskGroup() as tg:
            tg.create_task(fetch("c", 0.01, fail=True))
            tg.create_task(fetch("d", 0.5))  # cancelled when c fails
    except* ValueError as group:
        print("caught", [str(e) for e in group.exceptions])


if __name__ == "__main__":
    asyncio.run(main())
