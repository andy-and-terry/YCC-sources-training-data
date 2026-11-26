# Sexy primes: primes p with p + 6 also prime. 16 pairs below 100.
def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))

pairs = [(p, p + 6) for p in range(2, 100) if is_prime(p) and is_prime(p + 6)]
print(pairs)
print(len(pairs))
