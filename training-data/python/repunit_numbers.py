"""Repunits: numbers made only of the digit 1 (1, 11, 111, ...)."""


def repunits(count):
    r = 0
    for _ in range(count):
        r = r * 10 + 1
        yield r


print(list(repunits(5)))
