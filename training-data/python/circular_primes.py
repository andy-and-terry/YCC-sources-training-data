# Circular primes: every rotation of the digits is prime. Below 100 there are 13.
def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))

def is_circular(n):
    s = str(n)
    return all(is_prime(int(s[i:] + s[:i])) for i in range(len(s)))

found = [n for n in range(2, 100) if is_circular(n)]
print(found)
print(len(found))
