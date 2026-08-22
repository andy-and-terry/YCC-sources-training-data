import functools
import time
from typing import Callable, TypeVar

T = TypeVar("T")


def retry(max_attempts: int = 3, delay: float = 0.1, exceptions=(Exception,)):
    def decorator(func: Callable[..., T]) -> Callable[..., T]:
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            last_error = None
            for attempt in range(1, max_attempts + 1):
                try:
                    return func(*args, **kwargs)
                except exceptions as e:
                    last_error = e
                    if attempt < max_attempts:
                        time.sleep(delay * (2 ** (attempt - 1)))
            raise last_error

        return wrapper

    return decorator


def rate_limited(calls_per_second: float):
    min_interval = 1.0 / calls_per_second

    def decorator(func: Callable[..., T]) -> Callable[..., T]:
        last_called = [0.0]

        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            elapsed = time.monotonic() - last_called[0]
            wait = min_interval - elapsed
            if wait > 0:
                time.sleep(wait)
            last_called[0] = time.monotonic()
            return func(*args, **kwargs)

        return wrapper

    return decorator


def memoize(func: Callable[..., T]) -> Callable[..., T]:
    cache = {}

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        key = (args, tuple(sorted(kwargs.items())))
        if key not in cache:
            cache[key] = func(*args, **kwargs)
        return cache[key]

    wrapper.cache_clear = cache.clear
    return wrapper


class CallCounter:
    """Descriptor-based decorator that tracks how many times a method is called."""

    def __init__(self, func):
        functools.update_wrapper(self, func)
        self.func = func
        self.calls = 0

    def __call__(self, *args, **kwargs):
        self.calls += 1
        return self.func(*args, **kwargs)

    def __get__(self, instance, owner):
        return functools.partial(self.__call__, instance)


if __name__ == "__main__":
    attempts = [0]

    @retry(max_attempts=3, delay=0.01)
    def flaky():
        attempts[0] += 1
        if attempts[0] < 3:
            raise RuntimeError("not yet")
        return "ok"

    print(flaky(), attempts[0])

    @memoize
    def slow_square(n):
        return n * n

    print(slow_square(4), slow_square(4))
