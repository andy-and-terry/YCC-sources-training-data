#!/usr/bin/awk -f
BEGIN {
    split("10 9 2 5 3 7 101 18", arr, " ")
    n = 8
    best = 0
    for (i = 1; i <= n; i++) {
        dp[i] = 1
        for (j = 1; j < i; j++) {
            if (arr[j] < arr[i] && dp[j] + 1 > dp[i]) {
                dp[i] = dp[j] + 1
            }
        }
        if (dp[i] > best) best = dp[i]
    }
    print best
}
