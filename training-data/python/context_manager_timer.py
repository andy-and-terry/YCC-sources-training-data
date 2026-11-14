import time
from contextlib import contextmanager


@contextmanager
def timer(label: str):
    t0 = time.perf_counter()
    try:
        yield
    finally:
        print(f"{label}: {(time.perf_counter() - t0) * 1000:.1f} ms")


if __name__ == "__main__":
    with timer("sum"):
        sum(range(100_000))
