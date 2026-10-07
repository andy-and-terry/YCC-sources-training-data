import threading
import time
from typing import List

results: List[str] = []
results_lock = threading.Lock()


def worker(name: str, semaphore: threading.Semaphore) -> None:
    with semaphore:
        with results_lock:
            results.append(f"{name} acquired")
        time.sleep(0.01)
        with results_lock:
            results.append(f"{name} released")


def run_with_limit(worker_count: int, max_concurrent: int) -> List[str]:
    """Bounds concurrent access to a resource pool of size max_concurrent."""
    results.clear()
    semaphore = threading.Semaphore(max_concurrent)
    threads = [
        threading.Thread(target=worker, args=(f"worker-{i}", semaphore))
        for i in range(worker_count)
    ]
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    return list(results)


if __name__ == "__main__":
    log = run_with_limit(worker_count=6, max_concurrent=2)
    acquired = sum(1 for line in log if "acquired" in line)
    released = sum(1 for line in log if "released" in line)
    print(f"{acquired} acquires, {released} releases")
    assert acquired == released == 6
