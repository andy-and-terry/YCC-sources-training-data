def minCoins(coins, amount) {
    def dp = new int[amount + 1]
    Arrays.fill(dp, -1)
    dp[0] = 0
    for (int n = 1; n <= amount; n++) {
        for (c in coins) {
            if (c <= n && dp[n - c] != -1) {
                if (dp[n] == -1 || dp[n - c] + 1 < dp[n]) {
                    dp[n] = dp[n - c] + 1
                }
            }
        }
    }
    return dp[amount]
}

println minCoins([1, 2, 5], 11)
