def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))

def goldbach(n):
    return [(p, n - p) for p in range(2, n // 2 + 1) if is_prime(p) and is_prime(n - p)]

print(goldbach(28))
print(goldbach(100))
