def mod_pow(base, exp, mod):
    result = 1
    base %= mod
    while exp > 0:
        if exp & 1:
            result = result * base % mod
        base = base * base % mod
        exp >>= 1
    return result


def mod_inverse(a, p):
    """Inverse modulo a prime p via Fermat's little theorem."""
    return mod_pow(a, p - 2, p)


print(mod_pow(2, 10, 1000), pow(2, 10, 1000))
print(mod_pow(3, 200, 13))
print(mod_inverse(3, 7), pow(3, -1, 7))
