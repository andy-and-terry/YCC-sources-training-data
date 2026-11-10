def sieve(limit):
    flags = [True] * (limit + 1)
    flags[0:2] = [False, False]
    for i in range(2, int(limit ** 0.5) + 1):
        if flags[i]:
            flags[i * i::i] = [False] * len(flags[i * i::i])
    return flags


flags = sieve(80)
pairs = [(p, p + 2) for p in range(2, 79) if flags[p] and flags[p + 2]]
print(pairs)  # [(3, 5), (5, 7), (11, 13), (17, 19), (29, 31), (41, 43), (59, 61), (71, 73)]
