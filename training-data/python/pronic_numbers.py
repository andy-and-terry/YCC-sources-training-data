from math import isqrt


def pronic(count):
    return [n * (n + 1) for n in range(count)]


def is_pronic(x):
    n = isqrt(x)
    return n * (n + 1) == x


print(pronic(10))  # [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
print(is_pronic(56), is_pronic(57))  # True False
