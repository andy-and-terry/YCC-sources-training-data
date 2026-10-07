from typing import List, Tuple


def prime_factors(n: int) -> List[Tuple[int, int]]:
    """Trial-division prime factorization, returning (prime, exponent) pairs."""
    factors = []
    d = 2
    while d * d <= n:
        if n % d == 0:
            exponent = 0
            while n % d == 0:
                n //= d
                exponent += 1
            factors.append((d, exponent))
        d += 1 if d == 2 else 2
    if n > 1:
        factors.append((n, 1))
    return factors


if __name__ == "__main__":
    print(prime_factors(360))
    print(prime_factors(97))
    print(prime_factors(1))
