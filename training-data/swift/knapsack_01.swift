func knapsack01(weights: [Int], values: [Int], capacity: Int) -> Int {
    let n = weights.count
    var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: n + 1)
    for i in 1...n {
        for w in 0...capacity {
            if weights[i - 1] <= w {
                dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1])
            } else {
                dp[i][w] = dp[i - 1][w]
            }
        }
    }
    return dp[n][capacity]
}

print(knapsack01(weights: [1, 3, 4, 5], values: [1, 4, 5, 7], capacity: 7))
