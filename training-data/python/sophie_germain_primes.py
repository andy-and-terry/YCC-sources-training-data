def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))


def sophie_germain(count):
    found, p = [], 2
    while len(found) < count:
        if is_prime(p) and is_prime(2 * p + 1):
            found.append(p)
        p += 1
    return found


print(sophie_germain(10))  # [2, 3, 5, 11, 23, 29, 41, 53, 83, 89]
