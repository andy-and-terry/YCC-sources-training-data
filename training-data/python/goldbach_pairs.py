# Goldbach partitions: ways to write an even n as p + q with p <= q both prime.
def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))

def partitions(n):
    return [(p, n - p) for p in range(2, n // 2 + 1) if is_prime(p) and is_prime(n - p)]

print(partitions(100))
print(len(partitions(100)))  # 6
