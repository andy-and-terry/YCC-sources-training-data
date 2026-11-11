"""Emirps: primes whose digit reversal is a different prime."""


def is_prime(n):
    if n < 2:
        return False
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1
    return True


def emirps(limit):
    for n in range(2, limit):
        r = int(str(n)[::-1])
        if r != n and is_prime(n) and is_prime(r):
            yield n


print(list(emirps(100)))
