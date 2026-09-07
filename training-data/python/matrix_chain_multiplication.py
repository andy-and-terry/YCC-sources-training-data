def matrix_chain_order(dims):
    n = len(dims) - 1
    dp = [[0] * n for _ in range(n)]
    split = [[0] * n for _ in range(n)]

    for length in range(2, n + 1):
        for i in range(n - length + 1):
            j = i + length - 1
            dp[i][j] = float("inf")
            for k in range(i, j):
                cost = dp[i][k] + dp[k + 1][j] + dims[i] * dims[k + 1] * dims[j + 1]
                if cost < dp[i][j]:
                    dp[i][j] = cost
                    split[i][j] = k

    return dp[0][n - 1], split


def build_order(split, i, j):
    if i == j:
        return f"M{i}"
    k = split[i][j]
    left = build_order(split, i, k)
    right = build_order(split, k + 1, j)
    return f"({left} x {right})"


if __name__ == "__main__":
    dims = [40, 20, 30, 10, 30]
    min_cost, split = matrix_chain_order(dims)
    print(min_cost)
    print(build_order(split, 0, len(dims) - 2))
