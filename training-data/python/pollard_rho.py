from math import gcd


def rho(n: int) -> int:
    if n % 2 == 0:
        return 2
    x = y = 2
    d = 1
    while d == 1:
        x = (x * x + 1) % n
        y = (y * y + 1) % n
        y = (y * y + 1) % n
        d = gcd(abs(x - y), n)
    return d


n = 8051
p = rho(n)
print(f"{n} = {p} * {n // p}")
