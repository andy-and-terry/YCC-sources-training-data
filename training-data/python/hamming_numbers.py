# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
def is_hamming(n):
    for p in (2, 3, 5):
        while n % p == 0:
            n //= p
    return n == 1


found, n = [], 1
while len(found) < 20:
    if is_hamming(n):
        found.append(n)
    n += 1
print(" ".join(map(str, found)))
