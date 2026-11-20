# Aliquot sum: sum of proper divisors; classify perfect/abundant/deficient.
def aliquot(n):
    return sum(d for d in range(1, n) if n % d == 0)

for n in (6, 12, 15, 28):
    a = aliquot(n)
    print(n, a, "perfect" if a == n else "abundant" if a > n else "deficient")
