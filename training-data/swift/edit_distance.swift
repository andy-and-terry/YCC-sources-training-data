func editDistance(_ a: String, _ b: String) -> Int {
    let a = Array(a)
    let b = Array(b)
    var dp = Array(repeating: Array(repeating: 0, count: b.count + 1), count: a.count + 1)
    for i in 0...a.count { dp[i][0] = i }
    for j in 0...b.count { dp[0][j] = j }
    for i in 1...a.count {
        for j in 1...b.count {
            if a[i - 1] == b[j - 1] {
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                dp[i][j] = 1 + min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1])
            }
        }
    }
    return dp[a.count][b.count]
}

print(editDistance("kitten", "sitting"))
