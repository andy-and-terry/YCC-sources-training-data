# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
def is_practical(n):
    reach = {0}
    for d in range(1, n + 1):
        if n % d == 0:
            reach |= {r + d for r in reach}
    return all(m in reach for m in range(1, n + 1))

print(*[n for n in range(1, 41) if is_practical(n)])
