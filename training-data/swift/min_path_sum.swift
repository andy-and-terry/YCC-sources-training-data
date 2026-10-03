func minPathSum(_ grid: [[Int]]) -> Int {
    let rows = grid.count
    let cols = grid[0].count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
    dp[0][0] = grid[0][0]

    for j in 1..<cols {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    for i in 1..<rows {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    for i in 1..<rows {
        for j in 1..<cols {
            dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
        }
    }
    return dp[rows - 1][cols - 1]
}

print(minPathSum([[1, 3, 1], [1, 5, 1], [4, 2, 1]]))
