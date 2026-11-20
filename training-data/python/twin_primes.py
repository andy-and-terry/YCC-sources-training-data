# Twin prime pairs below a limit using a sieve.
def twins(limit):
    sieve = [True] * (limit + 1)
    sieve[0:2] = [False, False]
    for i in range(2, int(limit ** 0.5) + 1):
        if sieve[i]:
            sieve[i * i::i] = [False] * len(sieve[i * i::i])
    return [(p, p + 2) for p in range(2, limit - 1) if sieve[p] and sieve[p + 2]]

print(twins(50))
