# Perfect totient numbers: the sum of the iterated totient chain
# phi(n) + phi(phi(n)) + ... + 1 equals n.
from math import gcd

def phi(n):
    return sum(1 for k in range(1, n + 1) if gcd(k, n) == 1)

def is_perfect_totient(n):
    total, m = 0, n
    while m > 1:
        m = phi(m)
        total += m
    return total == n

print(*[n for n in range(2, 200) if is_perfect_totient(n)])
