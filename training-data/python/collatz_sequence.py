from functools import lru_cache


def collatz(n):
    seq = [n]
    while n != 1:
        n = n // 2 if n % 2 == 0 else 3 * n + 1
        seq.append(n)
    return seq


@lru_cache(maxsize=None)
def steps(n):
    if n == 1:
        return 0
    return 1 + steps(n // 2 if n % 2 == 0 else 3 * n + 1)


if __name__ == "__main__":
    print(collatz(27)[:15], "... length", len(collatz(27)))
    best = max(range(1, 10000), key=steps)
    print("longest under 10000:", best, steps(best))
