import functools
import time
from typing import Callable, ParamSpec, TypeVar

P = ParamSpec("P")
R = TypeVar("R")


def timed(fn: Callable[P, R]) -> Callable[P, R]:
    """Preserves the wrapped function's signature for type checkers."""

    @functools.wraps(fn)
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
        start = time.perf_counter()
        try:
            return fn(*args, **kwargs)
        finally:
            print(f"{fn.__name__} took {time.perf_counter() - start:.6f}s")

    return wrapper


@timed
def add(a: int, b: int = 0) -> int:
    return a + b


if __name__ == "__main__":
    print(add(2, b=3))
