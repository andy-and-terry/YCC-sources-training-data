"""Greedy decomposition of a fraction into distinct unit fractions."""
from fractions import Fraction


def egyptian(num, den):
    f = Fraction(num, den)
    parts = []
    while f.numerator != 0:
        d = -(-f.denominator // f.numerator)  # ceil
        parts.append(Fraction(1, d))
        f -= Fraction(1, d)
    return parts


if __name__ == "__main__":
    r = egyptian(4, 13)
    print(" + ".join(map(str, r)))
    assert sum(r) == Fraction(4, 13)
