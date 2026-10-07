def mod_pow(base: int, exp: int, mod: int) -> int:
    """Square-and-multiply modular exponentiation."""
    result = 1
    base %= mod
    while exp > 0:
        if exp & 1:
            result = result * base % mod
        base = base * base % mod
        exp >>= 1
    return result


def mod_inverse(a: int, p: int) -> int:
    """Inverse modulo a prime p via Fermat's little theorem."""
    return mod_pow(a, p - 2, p)


if __name__ == "__main__":
    print(mod_pow(2, 10, 1000), pow(2, 10, 1000))
    print(mod_pow(3, 200, 13))
    inv = mod_inverse(7, 1_000_000_007)
    print(inv, 7 * inv % 1_000_000_007)
