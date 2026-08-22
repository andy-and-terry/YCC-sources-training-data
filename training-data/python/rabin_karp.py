def rabin_karp(text: str, pattern: str, base: int = 256, mod: int = 1_000_000_007):
    n, m = len(text), len(pattern)
    if m > n:
        return []

    high_order = pow(base, m - 1, mod)
    pattern_hash = 0
    window_hash = 0
    for i in range(m):
        pattern_hash = (pattern_hash * base + ord(pattern[i])) % mod
        window_hash = (window_hash * base + ord(text[i])) % mod

    matches = []
    for i in range(n - m + 1):
        if window_hash == pattern_hash and text[i:i + m] == pattern:
            matches.append(i)
        if i < n - m:
            window_hash = (
                (window_hash - ord(text[i]) * high_order) * base + ord(text[i + m])
            ) % mod
    return matches


if __name__ == "__main__":
    print(rabin_karp("abxabcabcaby", "abcaby"))
