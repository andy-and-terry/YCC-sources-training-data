from math import isqrt


def is_pronic(n: int) -> bool:
    k = isqrt(n)
    return k * (k + 1) == n


if __name__ == "__main__":
    print([n for n in range(0, 100) if is_pronic(n)])
