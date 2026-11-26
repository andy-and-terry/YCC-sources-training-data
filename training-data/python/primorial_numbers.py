# Primorial: product of the first k primes. Count of primorials <= 10**6 is 8
# (1, 2, 6, 30, 210, 2310, 30030, 510510).
def primes():
    n = 2
    while True:
        if all(n % d for d in range(2, int(n ** 0.5) + 1)):
            yield n
        n += 1

value, out = 1, [1]
for p in primes():
    value *= p
    if value > 10 ** 6:
        break
    out.append(value)
print(out)
print(len(out))
