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
    return [p for p in range(2, limit)
            if is_prime(p) and int(str(p)[::-1]) != p and is_prime(int(str(p)[::-1]))]


if __name__ == "__main__":
    print(emirps(100))
