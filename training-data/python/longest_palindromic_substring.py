def longest_palindromic_substring(s: str) -> str:
    """Expand-around-center approach, O(n^2) time, O(1) extra space.

    Distinct from manacher_algorithm.py's O(n) approach -- this is the
    simpler quadratic technique most people reach for first.
    """
    if not s:
        return ""

    def expand(left: int, right: int) -> str:
        while left >= 0 and right < len(s) and s[left] == s[right]:
            left -= 1
            right += 1
        return s[left + 1:right]

    best = s[0]
    for i in range(len(s)):
        odd = expand(i, i)
        even = expand(i, i + 1)
        for candidate in (odd, even):
            if len(candidate) > len(best):
                best = candidate
    return best


if __name__ == "__main__":
    print(longest_palindromic_substring("babad"))
    print(longest_palindromic_substring("cbbd"))
    print(longest_palindromic_substring("a"))
