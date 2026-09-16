def extended_gcd(a, b):
    if b == 0:
        return a, 1, 0
    g, x1, y1 = extended_gcd(b, a % b)
    return g, y1, x1 - (a // b) * y1


def crt(remainders, moduli):
    x = 0
    product = 1
    for m in moduli:
        product *= m

    for r_i, m_i in zip(remainders, moduli):
        p = product // m_i
        _, inverse, _ = extended_gcd(p, m_i)
        x += r_i * inverse * p

    return x % product


if __name__ == "__main__":
    # x = 2 (mod 3), x = 3 (mod 5), x = 2 (mod 7) -> x = 23
    result = crt([2, 3, 2], [3, 5, 7])
    print(result)
    print(result % 3, result % 5, result % 7)
