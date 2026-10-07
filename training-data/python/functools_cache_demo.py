"""functools.cache / lru_cache as decorators (as opposed to the
hand-rolled LRU cache data structure elsewhere in this set): memoizing
a pure function transparently, plus cache_info() and cache_clear()."""

from functools import cache, lru_cache


@cache
def fib(n: int) -> int:
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)


call_count = 0


@lru_cache(maxsize=2)
def expensive_lookup(key: str) -> str:
    global call_count
    call_count += 1
    return key.upper()


if __name__ == "__main__":
    print(fib(30))
    print(fib.cache_info())  # hits/misses/maxsize/currsize

    expensive_lookup("a")
    expensive_lookup("b")
    expensive_lookup("a")  # cache hit, call_count stays at 2
    expensive_lookup("c")  # evicts "b" (least recently used, maxsize=2)
    expensive_lookup("b")  # cache miss again -> recomputed

    print("calls:", call_count)
    print(expensive_lookup.cache_info())
    expensive_lookup.cache_clear()
    print(expensive_lookup.cache_info())
