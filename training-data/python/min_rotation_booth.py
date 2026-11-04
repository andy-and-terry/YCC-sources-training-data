def min_rotation(s):
    """Return the lexicographically smallest rotation (simple O(n) two-pointer version)."""
    n = len(s)
    t = s + s
    i, j, k = 0, 1, 0
    while i < n and j < n and k < n:
        a, b = t[i + k], t[j + k]
        if a == b:
            k += 1
            continue
        if a > b:
            i += k + 1
        else:
            j += k + 1
        if i == j:
            j += 1
        k = 0
    start = min(i, j)
    return t[start:start + n]


print(min_rotation("bca"))  # abc
print(min_rotation("cabcab"))  # abcabc
