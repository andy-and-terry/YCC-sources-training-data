def lps(s):
    n = len(s)
    dp = [[0] * n for _ in range(n)]
    for i in range(n - 1, -1, -1):
        dp[i][i] = 1
        for j in range(i + 1, n):
            if s[i] == s[j]:
                dp[i][j] = dp[i + 1][j - 1] + 2
            else:
                dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
    # reconstruct
    i, j = 0, n - 1
    left, right = [], []
    while i <= j:
        if i == j:
            left.append(s[i]); break
        if s[i] == s[j]:
            left.append(s[i]); right.append(s[j]); i += 1; j -= 1
        elif dp[i + 1][j] >= dp[i][j - 1]:
            i += 1
        else:
            j -= 1
    return dp[0][n - 1] if n else 0, "".join(left + right[::-1])


if __name__ == "__main__":
    for s in ("bbbab", "character", "agbdba"):
        print(s, lps(s))
