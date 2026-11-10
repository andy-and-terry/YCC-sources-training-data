def sigma(n):
    return sum(d for d in range(1, n + 1) if n % d == 0)


print([n for n in range(1, 100) if sigma(sigma(n)) == 2 * n])  # [2, 4, 16, 64]
