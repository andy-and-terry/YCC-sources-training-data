"""Find the path to a positive fraction in the Stern-Brocot tree."""
from math import gcd


def path(p, q):
    g = gcd(p, q)
    p, q = p // g, q // g
    lo, hi = (0, 1), (1, 0)
    steps = []
    while True:
        mid = (lo[0] + hi[0], lo[1] + hi[1])
        if mid == (p, q):
            return "".join(steps)
        if p * mid[1] < mid[0] * q:
            steps.append("L")
            hi = mid
        else:
            steps.append("R")
            lo = mid


if __name__ == "__main__":
    print(path(3, 5))
    assert path(1, 1) == ""
