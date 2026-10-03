#!/usr/bin/awk -f
function min3(a, b, c) {
    if (a < b && a < c) return a
    if (b < c) return b
    return c
}
function levenshtein(s, t,    m, n, i, j, dp, cost) {
    m = length(s)
    n = length(t)
    for (i = 0; i <= m; i++) dp[i, 0] = i
    for (j = 0; j <= n; j++) dp[0, j] = j
    for (i = 1; i <= m; i++) {
        for (j = 1; j <= n; j++) {
            cost = (substr(s, i, 1) == substr(t, j, 1)) ? 0 : 1
            dp[i, j] = min3(dp[i - 1, j] + 1, dp[i, j - 1] + 1, dp[i - 1, j - 1] + cost)
        }
    }
    return dp[m, n]
}
BEGIN {
    print levenshtein("kitten", "sitting")
    print levenshtein("flaw", "lawn")
}
