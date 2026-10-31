from math import factorial


def is_factorion(n):
    return n == sum(factorial(int(d)) for d in str(n))


print([n for n in range(1, 50000) if is_factorion(n)])
