"""Fermat primality test: a**(n-1) % n == 1 for prime n (base a coprime).

Carmichael numbers such as 561 fool the test.
"""


def fermat_probably_prime(n, a=2):
    return n > 2 and pow(a, n - 1, n) == 1


for n in (97, 91, 561):
    print(n, fermat_probably_prime(n))
