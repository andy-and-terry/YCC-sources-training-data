from itertools import accumulate, count, islice


def triangular():
    return accumulate(count(1))


def is_triangular(n: int) -> bool:
    from math import isqrt
    d = 8 * n + 1
    return isqrt(d) ** 2 == d


if __name__ == "__main__":
    print(list(islice(triangular(), 10)))
    print(is_triangular(21), is_triangular(22))
