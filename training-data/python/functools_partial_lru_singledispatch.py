from functools import lru_cache, partial, singledispatch


@singledispatch
def show(x):
    return f"object {x!r}"


@show.register
def _(x: int):
    return f"int {x}"


@show.register
def _(x: list):
    return f"list of {len(x)}"


@lru_cache(maxsize=None)
def fib(n):
    return n if n < 2 else fib(n - 1) + fib(n - 2)


pow2 = partial(pow, 2)
print(show(3), show([1, 2]), show("s"))
print(fib(40), pow2(10))
