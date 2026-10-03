def mod_pow(base: int, exponent: int, modulus: int) -> int:
    """Fast (binary/square-and-multiply) modular exponentiation."""
    if modulus == 1:
        return 0
    result = 1
    base %= modulus
    while exponent > 0:
        if exponent & 1:
            result = (result * base) % modulus
        exponent >>= 1
        base = (base * base) % modulus
    return result


if __name__ == "__main__":
    print(mod_pow(2, 10, 1000))
    print(mod_pow(7, 128, 13))
    assert mod_pow(3, 200, 50) == pow(3, 200, 50)
    print("matches builtin pow")
