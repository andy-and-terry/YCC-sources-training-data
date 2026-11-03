from math import isqrt


def is_perfect_square(n: int) -> bool:
    return n >= 0 and isqrt(n) ** 2 == n


if __name__ == "__main__":
    print([n for n in range(30) if is_perfect_square(n)])
