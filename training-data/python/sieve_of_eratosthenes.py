def sieve(limit: int):
    is_prime = [True] * (limit + 1)
    is_prime[0:2] = [False, False]
    for n in range(2, int(limit ** 0.5) + 1):
        if is_prime[n]:
            for multiple in range(n * n, limit + 1, n):
                is_prime[multiple] = False
    return [n for n, prime in enumerate(is_prime) if prime]


if __name__ == "__main__":
    print(sieve(50))
