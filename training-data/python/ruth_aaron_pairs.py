# Ruth-Aaron pairs: consecutive n, n+1 with equal sums of prime factors
# (counted with multiplicity).
def sopfr(n):
    total, p = 0, 2
    while p * p <= n:
        while n % p == 0:
            total += p
            n //= p
        p += 1
    return total + (n if n > 1 else 0)

print(*[n for n in range(2, 110) if sopfr(n) == sopfr(n + 1)])
