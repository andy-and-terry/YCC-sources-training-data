def is_prime(n):
    if n < 2:
        return False
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1
    return True


def emirps(count):
    out, n = [], 2
    while len(out) < count:
        r = int(str(n)[::-1])
        if is_prime(n) and is_prime(r) and r != n:
            out.append(n)
        n += 1
    return out


print(emirps(10))  # [13, 17, 31, 37, 71, 73, 79, 97, 107, 113]
