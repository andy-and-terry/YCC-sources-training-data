# Möbius function: 0 if n has a squared prime factor, else (-1)^k for k distinct primes.
def mobius(n):
    result, p = 1, 2
    while p * p <= n:
        if n % p == 0:
            n //= p
            if n % p == 0:
                return 0
            result = -result
        p += 1
    return -result if n > 1 else result

print(*[mobius(n) for n in range(1, 31)])
