def sigma(n):
    return sum(d + (n // d if d * d != n else 0) for d in range(1, int(n ** 0.5) + 1) if n % d == 0)

print([n for n in range(1, 21) if sigma(n) < 2 * n])
