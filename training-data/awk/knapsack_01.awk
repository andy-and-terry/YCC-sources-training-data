#!/usr/bin/awk -f
function max(a, b) { return a > b ? a : b }
BEGIN {
    split("2 3 4 5", weights, " ")
    split("3 4 5 6", values, " ")
    n = 4
    capacity = 5

    for (w = 0; w <= capacity; w++) dp[0, w] = 0
    for (i = 1; i <= n; i++) {
        for (w = 0; w <= capacity; w++) {
            dp[i, w] = dp[i - 1, w]
            if (weights[i] <= w) {
                dp[i, w] = max(dp[i, w], dp[i - 1, w - weights[i]] + values[i])
            }
        }
    }
    print dp[n, capacity]
}
