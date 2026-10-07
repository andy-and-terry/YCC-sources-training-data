"""asyncio.Semaphore, asyncio.wait_for and asyncio.gather(return_exceptions=True):
limiting concurrency, enforcing a per-task timeout, and collecting a
mix of successes and failures without one failure cancelling the rest."""

import asyncio


async def worker(name: str, duration: float, semaphore: asyncio.Semaphore, log: list) -> str:
    async with semaphore:
        log.append(f"{name} started")
        await asyncio.sleep(duration)
        log.append(f"{name} finished")
        return f"{name} done"


async def run_with_limited_concurrency(max_concurrent: int) -> list:
    semaphore = asyncio.Semaphore(max_concurrent)
    log: list = []
    tasks = [
        asyncio.create_task(worker(f"job-{i}", 0.02, semaphore, log))
        for i in range(5)
    ]
    results = await asyncio.gather(*tasks)
    return results, log


async def flaky_task(should_fail: bool) -> str:
    await asyncio.sleep(0.01)
    if should_fail:
        raise ValueError("task failed")
    return "ok"


async def run_and_collect_errors() -> list:
    """return_exceptions=True turns a raised exception into a regular
    result in the output list, instead of propagating it and cancelling
    the sibling tasks."""
    return await asyncio.gather(
        flaky_task(False),
        flaky_task(True),
        flaky_task(False),
        return_exceptions=True,
    )


async def run_with_timeout() -> str:
    try:
        return await asyncio.wait_for(asyncio.sleep(0.1, result="finished"), timeout=0.02)
    except asyncio.TimeoutError:
        return "timed out"


async def main() -> None:
    results, log = await run_with_limited_concurrency(max_concurrent=2)
    print(results)
    # at most 2 "started" entries should ever appear before a "finished"
    print(log)

    outcomes = await run_and_collect_errors()
    for outcome in outcomes:
        if isinstance(outcome, Exception):
            print("error:", outcome)
        else:
            print("result:", outcome)

    print(await run_with_timeout())


if __name__ == "__main__":
    asyncio.run(main())
