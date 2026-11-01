# Pernicious numbers: the population count (number of 1 bits) is prime.
def is_prime(n):
    return n >= 2 and all(n % d for d in range(2, int(n ** 0.5) + 1))

def is_pernicious(n):
    return is_prime(bin(n).count("1"))

print(*[n for n in range(1, 21) if is_pernicious(n)])
