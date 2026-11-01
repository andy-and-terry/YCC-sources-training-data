from math import isqrt

# n is triangular iff 8n + 1 is a perfect square.
def is_triangular(n):
    s = 8 * n + 1
    r = isqrt(s)
    return r * r == s

print(*[n for n in range(21) if is_triangular(n)])  # 0 1 3 6 10 15
