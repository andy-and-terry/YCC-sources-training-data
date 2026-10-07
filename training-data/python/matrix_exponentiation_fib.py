MOD = 10 ** 9 + 7


def mat_mul(a, b):
    return [
        [(a[0][0] * b[0][0] + a[0][1] * b[1][0]) % MOD, (a[0][0] * b[0][1] + a[0][1] * b[1][1]) % MOD],
        [(a[1][0] * b[0][0] + a[1][1] * b[1][0]) % MOD, (a[1][0] * b[0][1] + a[1][1] * b[1][1]) % MOD],
    ]


def mat_pow(m, n):
    result = [[1, 0], [0, 1]]
    while n:
        if n & 1:
            result = mat_mul(result, m)
        m = mat_mul(m, m)
        n >>= 1
    return result


def fib(n):
    return mat_pow([[1, 1], [1, 0]], n)[0][1]


if __name__ == "__main__":
    print([fib(i) for i in range(15)])
    print("fib(10^18) mod 1e9+7 =", fib(10 ** 18))
