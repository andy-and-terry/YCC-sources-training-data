def binomial(n, k):
    if k < 0 or k > n:
        return 0
    k = min(k, n - k)
    result = 1
    for i in range(1, k + 1):
        result = result * (n - k + i) // i
    return result


def binomial_mod_table(n, mod):
    fact = [1] * (n + 1)
    for i in range(1, n + 1):
        fact[i] = fact[i - 1] * i % mod
    inv = [1] * (n + 1)
    inv[n] = pow(fact[n], mod - 2, mod)
    for i in range(n, 0, -1):
        inv[i - 1] = inv[i] * i % mod
    return lambda a, b: 0 if b < 0 or b > a else fact[a] * inv[b] % mod * inv[a - b] % mod


if __name__ == "__main__":
    print(binomial(10, 3), binomial(52, 5))
    c = binomial_mod_table(1000, 10 ** 9 + 7)
    print(c(1000, 500))
