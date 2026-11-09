from contextlib import contextmanager, suppress
import time


@contextmanager
def timer(label):
    t = time.perf_counter()
    try:
        yield
    finally:
        print(f"{label}: {time.perf_counter() - t:.4f}s")


with timer("sum"):
    sum(range(100000))
with suppress(ZeroDivisionError):
    1 / 0
