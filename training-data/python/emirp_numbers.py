def is_prime(n):
    if n < 2:
        return False
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1
    return True


def emirps(limit):
    out = []
    for p in range(2, limit):
        r = int(str(p)[::-1])
        if r != p and is_prime(p) and is_prime(r):
            out.append(p)
    return out


print(emirps(200))
# [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
