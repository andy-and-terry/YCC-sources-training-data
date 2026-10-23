def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n**0.5) + 1))


def lucas_lehmer(p):
    if p == 2:
        return True
    m = (1 << p) - 1
    s = 4
    for _ in range(p - 2):
        s = (s * s - 2) % m
    return s == 0


print(*(p for p in range(2, 20) if is_prime(p) and lucas_lehmer(p)))
