int min_coins(int[] coins, int amount) {
    int[] dp = new int[amount + 1];
    for (int i = 1; i <= amount; i++) dp[i] = -1;
    for (int n = 1; n <= amount; n++) {
        foreach (int c in coins) {
            if (c <= n && dp[n - c] != -1) {
                if (dp[n] == -1 || dp[n - c] + 1 < dp[n]) {
                    dp[n] = dp[n - c] + 1;
                }
            }
        }
    }
    return dp[amount];
}

void main() {
    int[] coins = { 1, 2, 5 };
    stdout.printf("%d\n", min_coins(coins, 11));
}
