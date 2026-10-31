def prime_factor_count(n):
    count, p = 0, 2
    while p * p <= n:
        while n % p == 0:
            n //= p
            count += 1
        p += 1
    return count + (1 if n > 1 else 0)


print([n for n in range(2, 30) if prime_factor_count(n) == 2])
