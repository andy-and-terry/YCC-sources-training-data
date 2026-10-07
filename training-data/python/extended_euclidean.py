from typing import Tuple


def extended_gcd(a: int, b: int) -> Tuple[int, int, int]:
    """Returns (g, x, y) such that a*x + b*y = g = gcd(a, b)."""
    if b == 0:
        return a, 1, 0
    g, x1, y1 = extended_gcd(b, a % b)
    x = y1
    y = x1 - (a // b) * y1
    return g, x, y


def mod_inverse(a: int, m: int) -> int:
    g, x, _ = extended_gcd(a, m)
    if g != 1:
        raise ValueError(f"{a} has no inverse modulo {m}")
    return x % m


if __name__ == "__main__":
    print(extended_gcd(35, 15))
    print(mod_inverse(3, 11))
    assert (3 * mod_inverse(3, 11)) % 11 == 1
