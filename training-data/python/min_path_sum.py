def min_path_sum(grid):
    rows, cols = len(grid), len(grid[0])
    dp = [[0] * cols for _ in range(rows)]
    for r in range(rows):
        for c in range(cols):
            if r == 0 and c == 0:
                dp[r][c] = grid[r][c]
            elif r == 0:
                dp[r][c] = dp[r][c - 1] + grid[r][c]
            elif c == 0:
                dp[r][c] = dp[r - 1][c] + grid[r][c]
            else:
                dp[r][c] = min(dp[r - 1][c], dp[r][c - 1]) + grid[r][c]
    # reconstruct path
    path, r, c = [], rows - 1, cols - 1
    while (r, c) != (0, 0):
        path.append((r, c))
        if r == 0 or (c > 0 and dp[r][c - 1] < dp[r - 1][c]):
            c -= 1
        else:
            r -= 1
    path.append((0, 0))
    return dp[-1][-1], path[::-1]


if __name__ == "__main__":
    print(min_path_sum([[1, 3, 1], [1, 5, 1], [4, 2, 1]]))
