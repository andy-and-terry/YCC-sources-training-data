def pow_mod(base, exp, mod):
    result = 1
    base %= mod
    while exp > 0:
        if exp & 1:
            result = result * base % mod
        base = base * base % mod
        exp >>= 1
    return result


if __name__ == "__main__":
    for b, e, m in [(2, 10, 1000), (3, 200, 13), (7, 10 ** 18, 10 ** 9 + 7)]:
        assert pow_mod(b, e, m) == pow(b, e, m)
        print(f"{b}^{e} mod {m} = {pow_mod(b, e, m)}")
