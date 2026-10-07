def unique_paths(grid):
    rows, cols = len(grid), len(grid[0])
    dp = [0] * cols
    dp[0] = 1 if grid[0][0] == 0 else 0
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == 1:
                dp[c] = 0
            elif c > 0:
                dp[c] += dp[c - 1]
    return dp[-1]


if __name__ == "__main__":
    print(unique_paths([[0] * 7 for _ in range(3)]))
    print(unique_paths([[0, 0, 0], [0, 1, 0], [0, 0, 0]]))
