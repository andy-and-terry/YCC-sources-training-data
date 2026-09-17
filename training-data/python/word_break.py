def word_break(s, word_dict):
    words = set(word_dict)
    n = len(s)
    dp = [False] * (n + 1)
    dp[0] = True

    for i in range(1, n + 1):
        for j in range(i):
            if dp[j] and s[j:i] in words:
                dp[i] = True
                break

    return dp[n]


def word_break_segments(s, word_dict):
    """Return one valid segmentation if s can be broken, else None."""
    words = set(word_dict)
    n = len(s)
    dp = [None] * (n + 1)
    dp[0] = []

    for i in range(1, n + 1):
        for j in range(i):
            if dp[j] is not None and s[j:i] in words:
                dp[i] = dp[j] + [s[j:i]]
                break

    return dp[n]


if __name__ == "__main__":
    dictionary = ["leet", "code", "sand", "and", "cats", "dog"]
    print(word_break("leetcode", dictionary))
    print(word_break("catsandog", dictionary + ["sand"]))
    print(word_break_segments("leetcode", dictionary))
