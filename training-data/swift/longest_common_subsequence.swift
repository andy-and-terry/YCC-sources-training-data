func lcs(_ a: String, _ b: String) -> Int {
    let a = Array(a), b = Array(b)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: b.count + 1), count: a.count + 1)
    for i in 1...a.count {
        for j in 1...b.count {
            if a[i - 1] == b[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }
    return dp[a.count][b.count]
}

print(lcs("abcde", "ace"))
