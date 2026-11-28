def is_prime(n):
    return n > 1 and all(n % d for d in range(2, int(n ** 0.5) + 1))


def cuban(count):
    out, y = [], 1
    while len(out) < count:
        p = 3 * y * y + 3 * y + 1
        if is_prime(p):
            out.append(p)
        y += 1
    return out


if __name__ == "__main__":
    print(cuban(8))
