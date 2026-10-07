int rod_cutting(int[] prices, int n) {
    int[] dp = new int[n + 1];
    dp[0] = 0;

    for (int len = 1; len <= n; len++) {
        int best = int.MIN;
        for (int cut = 1; cut <= len; cut++) {
            best = int.max(best, prices[cut - 1] + dp[len - cut]);
        }
        dp[len] = best;
    }
    return dp[n];
}

void main() {
    int[] prices = { 1, 5, 8, 9, 10, 17, 17, 20 };
    stdout.printf("%d\n", rod_cutting(prices, 8));
}
