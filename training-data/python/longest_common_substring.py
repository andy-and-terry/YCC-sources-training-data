def longest_common_substring(a: str, b: str) -> str:
    """DP over contiguous substrings -- distinct from LCS (subsequence),
    which allows gaps; this requires the match to be contiguous in both."""
    dp = [[0] * (len(b) + 1) for _ in range(len(a) + 1)]
    best_len = 0
    best_end = 0
    for i in range(1, len(a) + 1):
        for j in range(1, len(b) + 1):
            if a[i - 1] == b[j - 1]:
                dp[i][j] = dp[i - 1][j - 1] + 1
                if dp[i][j] > best_len:
                    best_len = dp[i][j]
                    best_end = i
    return a[best_end - best_len:best_end]


if __name__ == "__main__":
    print(longest_common_substring("abcdxyz", "xyzabcd"))
    print(longest_common_substring("zxabcdezy", "yzabcdezx"))
