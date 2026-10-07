def longest_common_prefix(words):
    if not words:
        return ""
    lo, hi = min(words), max(words)
    i = 0
    while i < len(lo) and lo[i] == hi[i]:
        i += 1
    return lo[:i]


if __name__ == "__main__":
    print(longest_common_prefix(["flower", "flow", "flight"]))
    print(repr(longest_common_prefix(["dog", "racecar", "car"])))
