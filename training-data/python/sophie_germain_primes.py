# Sophie Germain primes: p is prime and 2p + 1 is also prime.
def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))

print(*[p for p in range(2, 100) if is_prime(p) and is_prime(2 * p + 1)])
