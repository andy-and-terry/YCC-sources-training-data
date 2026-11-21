# Carmichael numbers: composite n with a**(n-1) % n == 1 for every a
# coprime to n (Fermat pseudoprimes to all bases).
from math import gcd

def is_prime(n):
    return n > 1 and all(n % p for p in range(2, int(n ** 0.5) + 1))

def is_carmichael(n):
    return (not is_prime(n)) and all(
        pow(a, n - 1, n) == 1 for a in range(2, n) if gcd(a, n) == 1)

print(*[n for n in range(3, 3000, 2) if is_carmichael(n)])
