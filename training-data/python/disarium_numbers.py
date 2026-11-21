# Disarium numbers: sum of digits raised to their 1-based positions equals n.
def is_disarium(n):
    return sum(int(c) ** (i + 1) for i, c in enumerate(str(n))) == n

print(*[n for n in range(1, 1000) if is_disarium(n)])
