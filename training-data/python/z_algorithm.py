"""Z-algorithm: for each position i, z[i] is the length of the longest
substring starting at i that matches a prefix of the string. Building
pattern + '$' + text lets the Z-array locate every occurrence of
pattern in text in O(len(pattern) + len(text))."""

from typing import List


def z_array(s: str) -> List[int]:
    n = len(s)
    z = [0] * n
    left, right = 0, 0
    for i in range(1, n):
        if i < right:
            z[i] = min(right - i, z[i - left])
        while i + z[i] < n and s[z[i]] == s[i + z[i]]:
            z[i] += 1
        if i + z[i] > right:
            left, right = i, i + z[i]
    return z


def find_occurrences(text: str, pattern: str) -> List[int]:
    if not pattern:
        return []
    combined = pattern + "$" + text
    z = z_array(combined)
    plen = len(pattern)
    return [i - plen - 1 for i in range(plen + 1, len(combined)) if z[i] >= plen]


if __name__ == "__main__":
    print(z_array("aaabaab"))
    print(find_occurrences("abxabcabcabyabc", "abc"))
    print(find_occurrences("aaaa", "aa"))
