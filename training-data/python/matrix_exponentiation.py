Matrix = list[list[int]]


def mat_mul(a: Matrix, b: Matrix) -> Matrix:
    n, m, p = len(a), len(b), len(b[0])
    return [[sum(a[i][k] * b[k][j] for k in range(m)) for j in range(p)]
            for i in range(n)]


def mat_pow(m: Matrix, power: int) -> Matrix:
    size = len(m)
    result = [[int(i == j) for j in range(size)] for i in range(size)]
    while power:
        if power & 1:
            result = mat_mul(result, m)
        m = mat_mul(m, m)
        power >>= 1
    return result


def fib(n: int) -> int:
    return mat_pow([[1, 1], [1, 0]], n)[0][1]


if __name__ == "__main__":
    print([fib(i) for i in range(11)])
    print(fib(200))
