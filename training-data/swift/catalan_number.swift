func catalan(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: n + 1)
    dp[0] = 1
    for i in 1...max(n, 1) where n > 0 {
        var sum = 0
        for j in 0..<i {
            sum += dp[j] * dp[i - 1 - j]
        }
        dp[i] = sum
    }
    return dp[n]
}

for i in 0..<8 {
    print("C(\(i)) = \(catalan(i))")
}
