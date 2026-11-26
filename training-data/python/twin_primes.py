# Twin primes: primes p with p + 2 also prime. Count pairs below 100 (8).
def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))

pairs = [(p, p + 2) for p in range(2, 100) if is_prime(p) and is_prime(p + 2)]
print(pairs)
print(len(pairs))
