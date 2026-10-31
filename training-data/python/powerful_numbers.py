def is_powerful(n):
    p = 2
    while p * p <= n:
        if n % p == 0:
            if n % (p * p) != 0:
                return False
            while n % p == 0:
                n //= p
        p += 1
    return n == 1


print([n for n in range(1, 101) if is_powerful(n)])
