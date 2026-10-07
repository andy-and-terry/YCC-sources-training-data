#!/usr/bin/awk -f
BEGIN {
    split("1 5 6 8", coins, " ")
    n = 4
    amount = 11
    dp[0] = 0
    for (a = 1; a <= amount; a++) dp[a] = 999999

    for (a = 1; a <= amount; a++) {
        for (i = 1; i <= n; i++) {
            c = coins[i]
            if (c <= a && dp[a - c] + 1 < dp[a]) {
                dp[a] = dp[a - c] + 1
            }
        }
    }
    print (dp[amount] >= 999999) ? -1 : dp[amount]
}
