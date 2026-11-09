from functools import lru_cache, partial, reduce


@lru_cache(maxsize=None)
def fib(n: int) -> int:
    return n if n < 2 else fib(n - 1) + fib(n - 2)


power_of_two = partial(pow, 2)
print(fib(60), power_of_two(10), reduce(lambda a, b: a * b, range(1, 6)))
