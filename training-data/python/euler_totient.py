def phi(n):
    result = n
    p = 2
    while p * p <= n:
        if n % p == 0:
            while n % p == 0:
                n //= p
            result -= result // p
        p += 1
    if n > 1:
        result -= result // n
    return result


def phi_sieve(limit):
    phis = list(range(limit + 1))
    for i in range(2, limit + 1):
        if phis[i] == i:
            for j in range(i, limit + 1, i):
                phis[j] -= phis[j] // i
    return phis


if __name__ == "__main__":
    print([phi(n) for n in range(1, 21)])
    assert phi_sieve(20)[1:] == [phi(n) for n in range(1, 21)]
