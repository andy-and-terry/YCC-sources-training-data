def longest_unique(s):
    last = {}
    start = 0
    best = (0, 0)
    for i, c in enumerate(s):
        if c in last and last[c] >= start:
            start = last[c] + 1
        last[c] = i
        if i + 1 - start > best[1] - best[0]:
            best = (start, i + 1)
    return s[best[0]:best[1]]


if __name__ == "__main__":
    for s in ("abcabcbb", "bbbbb", "pwwkew", "dvdf"):
        r = longest_unique(s)
        print(s, r, len(r))
