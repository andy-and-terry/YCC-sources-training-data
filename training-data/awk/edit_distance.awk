#!/usr/bin/awk -f
# Computes the Levenshtein edit distance between the two words on each
# input line (space-separated), via the classic O(n*m) DP table.
{
    a = $1
    b = $2
    la = length(a)
    lb = length(b)

    for (i = 0; i <= la; i++) dp[i, 0] = i
    for (j = 0; j <= lb; j++) dp[0, j] = j

    for (i = 1; i <= la; i++) {
        for (j = 1; j <= lb; j++) {
            cost = (substr(a, i, 1) == substr(b, j, 1)) ? 0 : 1
            delCost = dp[i - 1, j] + 1
            insCost = dp[i, j - 1] + 1
            subCost = dp[i - 1, j - 1] + cost
            best = delCost
            if (insCost < best) best = insCost
            if (subCost < best) best = subCost
            dp[i, j] = best
        }
    }
    print dp[la, lb]
    delete dp
}
