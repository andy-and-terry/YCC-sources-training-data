from collections import Counter


def factorize(n):
    factors = Counter()
    d = 2
    while d * d <= n:
        while n % d == 0:
            factors[d] += 1
            n //= d
        d += 1 if d == 2 else 2
    if n > 1:
        factors[n] += 1
    return factors


def fmt(factors):
    return " * ".join(f"{p}^{e}" if e > 1 else str(p) for p, e in sorted(factors.items()))


if __name__ == "__main__":
    for n in (360, 97, 1001, 2 ** 10 * 3 ** 4):
        print(n, "=", fmt(factorize(n)))
