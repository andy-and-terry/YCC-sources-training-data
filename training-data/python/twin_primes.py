def primes_upto(n):
    sieve = [True] * (n + 1)
    sieve[0:2] = [False, False]
    for i in range(2, int(n ** 0.5) + 1):
        if sieve[i]:
            sieve[i * i::i] = [False] * len(sieve[i * i::i])
    return [i for i, p in enumerate(sieve) if p]

ps = primes_upto(50)
print([(p, q) for p, q in zip(ps, ps[1:]) if q - p == 2])
