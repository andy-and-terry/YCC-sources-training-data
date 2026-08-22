import math


def gcd(a: int, b: int) -> int:
    while b:
        a, b = b, a % b
    return abs(a)


def lcm(a: int, b: int) -> int:
    return abs(a * b) // gcd(a, b) if a and b else 0


if __name__ == "__main__":
    print(gcd(48, 18), lcm(4, 6), math.gcd(48, 18))
