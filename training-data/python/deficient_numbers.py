# Deficient numbers: sum of proper divisors < n. 76 of them below 100.
def sigma(n):
    return sum(d for d in range(1, n) if n % d == 0)

print(sum(sigma(n) < n for n in range(1, 100)))
