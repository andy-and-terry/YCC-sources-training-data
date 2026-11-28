func minimumTotal(_ t: [[Int]]) -> Int {
    var dp = t[t.count - 1]
    for r in stride(from: t.count - 2, through: 0, by: -1) {
        for i in 0..<t[r].count {
            dp[i] = t[r][i] + min(dp[i], dp[i + 1])
        }
    }
    return dp[0]
}

print(minimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])) // 11
