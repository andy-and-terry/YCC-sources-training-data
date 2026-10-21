"""Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)."""
from itertools import islice


def tribonacci():
    a, b, c = 0, 0, 1
    while True:
        yield a
        a, b, c = b, c, a + b + c


if __name__ == "__main__":
    print("Tribonacci:", list(islice(tribonacci(), 15)))
