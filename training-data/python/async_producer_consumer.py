import asyncio
import random
from dataclasses import dataclass, field
from typing import List


@dataclass
class Job:
    id: int
    payload: str


@dataclass
class Result:
    job_id: int
    output: str
    errors: List[str] = field(default_factory=list)


async def producer(queue: asyncio.Queue, count: int):
    for i in range(count):
        await queue.put(Job(id=i, payload=f"payload-{i}"))
        await asyncio.sleep(0)  # yield control
    for _ in range(3):  # sentinel per consumer
        await queue.put(None)


async def consumer(name: str, queue: asyncio.Queue, results: List[Result]):
    while True:
        job = await queue.get()
        if job is None:
            queue.task_done()
            break
        try:
            await asyncio.sleep(random.uniform(0, 0.01))
            results.append(Result(job_id=job.id, output=f"{name} processed {job.payload}"))
        except Exception as e:
            results.append(Result(job_id=job.id, output="", errors=[str(e)]))
        finally:
            queue.task_done()


async def run_pipeline(job_count: int = 20, consumer_count: int = 3) -> List[Result]:
    queue: asyncio.Queue = asyncio.Queue(maxsize=5)
    results: List[Result] = []

    producers = [asyncio.create_task(producer(queue, job_count))]
    consumers = [
        asyncio.create_task(consumer(f"worker-{i}", queue, results))
        for i in range(consumer_count)
    ]

    await asyncio.gather(*producers)
    await asyncio.gather(*consumers)
    return results


async def main():
    results = await run_pipeline()
    print(f"processed {len(results)} jobs")


if __name__ == "__main__":
    asyncio.run(main())
