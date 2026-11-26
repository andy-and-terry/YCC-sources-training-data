# Emirps: primes whose digit reversal is a different prime. Below 200 there are 15.
def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))

def is_emirp(n):
    r = int(str(n)[::-1])
    return r != n and is_prime(n) and is_prime(r)

found = [n for n in range(2, 200) if is_emirp(n)]
print(found)
print(len(found))
