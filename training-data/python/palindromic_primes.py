def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))


def is_palindrome(n):
    s = str(n)
    return s == s[::-1]


print([n for n in range(200) if is_palindrome(n) and is_prime(n)])
# [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
