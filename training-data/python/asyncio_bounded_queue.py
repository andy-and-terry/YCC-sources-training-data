import asyncio


async def produce(queue: asyncio.Queue, items):
    for item in items:
        await queue.put(item)
    await queue.join()


async def consume(queue: asyncio.Queue, log):
    while True:
        item = await queue.get()
        log.append(item * item)
        queue.task_done()


async def main():
    queue = asyncio.Queue(maxsize=3)
    log = []
    consumer_task = asyncio.create_task(consume(queue, log))
    await produce(queue, range(10))
    consumer_task.cancel()
    print(log)


if __name__ == "__main__":
    asyncio.run(main())
