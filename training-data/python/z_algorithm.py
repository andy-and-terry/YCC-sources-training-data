from typing import List


def z_array(s: str) -> List[int]:
    """z[i] = length of the longest substring starting at i that matches
    a prefix of s. Built in O(n) using a window [l, r) of the rightmost
    known prefix-match."""
    n = len(s)
    z = [0] * n
    z[0] = n
    l, r = 0, 0
    for i in range(1, n):
        if i < r:
            z[i] = min(r - i, z[i - l])
        while i + z[i] < n and s[z[i]] == s[i + z[i]]:
            z[i] += 1
        if i + z[i] > r:
            l, r = i, i + z[i]
    return z


def z_search(text: str, pattern: str) -> List[int]:
    """Find every occurrence of pattern in text using the Z-array of
    pattern + separator + text."""
    if not pattern:
        return []
    combined = pattern + "\x00" + text
    z = z_array(combined)
    m = len(pattern)
    matches = []
    for i in range(m + 1, len(combined)):
        if z[i] >= m:
            matches.append(i - m - 1)
    return matches


if __name__ == "__main__":
    print(z_array("aabxaabxcaabxaabxay"))
    print(z_search("abxabcabcaby", "abcaby"))
    print(z_search("aaaaa", "aa"))
