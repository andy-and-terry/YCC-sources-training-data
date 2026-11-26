# Palindromic primes below 200: 2 3 5 7 11 101 131 151 181 191 (10 of them).
def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))

found = [n for n in range(2, 200) if str(n) == str(n)[::-1] and is_prime(n)]
print(found)
print(len(found))
