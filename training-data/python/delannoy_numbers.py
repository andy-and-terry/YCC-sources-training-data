def central_delannoy(n):
    # D(m, k) = D(m-1, k) + D(m, k-1) + D(m-1, k-1)
    grid = [[1] * (n + 1) for _ in range(n + 1)]
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            grid[i][j] = grid[i - 1][j] + grid[i][j - 1] + grid[i - 1][j - 1]
    return grid[n][n]


print([central_delannoy(n) for n in range(6)])  # [1, 3, 13, 63, 321, 1683]
