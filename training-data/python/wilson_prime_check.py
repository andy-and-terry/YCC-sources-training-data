# Wilson's theorem: n is prime iff (n-1)! % n == n-1.
def wilson_is_prime(n):
    if n < 2:
        return False
    fact = 1
    for i in range(2, n):
        fact = fact * i % n
    return fact == n - 1

print([n for n in range(2, 20) if wilson_is_prime(n)])
