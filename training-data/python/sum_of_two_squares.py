# Which positive integers can be written as a*a + b*b with a, b >= 0?
def representable(n):
    a = 0
    while a * a <= n:
        b2 = n - a * a
        b = int(b2 ** 0.5)
        if b * b == b2:
            return True
        a += 1
    return False

print(*[n for n in range(1, 31) if representable(n)])
