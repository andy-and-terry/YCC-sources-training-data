def prime_exponents(n):
    result, p = [], 2
    while p * p <= n:
        e = 0
        while n % p == 0:
            n //= p
            e += 1
        if e:
            result.append(e)
        p += 1
    if n > 1:
        result.append(1)
    return result


def is_sphenic(n):
    return prime_exponents(n) == [1, 1, 1]


print([n for n in range(2, 80) if is_sphenic(n)])
