"""Stirling numbers of the second kind: S(n,k) = k*S(n-1,k) + S(n-1,k-1)."""


def stirling2(n, k):
    table = [[0] * (k + 1) for _ in range(n + 1)]
    table[0][0] = 1
    for i in range(1, n + 1):
        for j in range(1, min(i, k) + 1):
            table[i][j] = j * table[i - 1][j] + table[i - 1][j - 1]
    return table[n][k]


if __name__ == "__main__":
    print(stirling2(5, 2), stirling2(6, 3))
    assert stirling2(5, 2) == 15 and stirling2(6, 3) == 90
