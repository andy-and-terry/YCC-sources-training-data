"""functools building blocks beyond caching: reduce for folding a
sequence into one value, partial for pre-binding arguments, and
cmp_to_key for sorting with a two-argument comparator."""

from functools import cmp_to_key, partial, reduce
from typing import List


def product(numbers: List[int]) -> int:
    return reduce(lambda acc, n: acc * n, numbers, 1)


def flatten_once(nested: List[list]) -> list:
    return reduce(lambda acc, sub: acc + sub, nested, [])


def multiply(factor: int, value: int) -> int:
    return factor * value


def make_scaler(factor: int):
    """partial pre-binds the leading argument, producing a specialized
    single-argument function without writing a new def."""
    return partial(multiply, factor)


def sort_by_custom_rule(words: List[str]) -> List[str]:
    """cmp_to_key adapts an old-style (a, b) -> -1/0/1 comparator for
    use with sort()/sorted(), which otherwise expect a `key` function."""

    def compare(a: str, b: str) -> int:
        if len(a) != len(b):
            return len(a) - len(b)
        return -1 if a < b else (1 if a > b else 0)

    return sorted(words, key=cmp_to_key(compare))


if __name__ == "__main__":
    print(product([1, 2, 3, 4, 5]))
    print(flatten_once([[1, 2], [3], [4, 5, 6]]))

    double = make_scaler(2)
    triple = make_scaler(3)
    print(double(10), triple(10))

    print(sort_by_custom_rule(["banana", "fig", "kiwi", "date", "apple"]))
