func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp = [Int](repeating: amount + 1, count: amount + 1)
    dp[0] = 0
    for a in 1...amount {
        for coin in coins where coin <= a {
            dp[a] = min(dp[a], dp[a - coin] + 1)
        }
    }
    return dp[amount] > amount ? -1 : dp[amount]
}

print(coinChange([1, 2, 5], 11))
