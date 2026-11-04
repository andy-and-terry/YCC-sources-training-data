def ugly(n):
    """n-th number whose only prime factors are 2, 3, 5 (three-pointer merge)."""
    seq = [1]
    i2 = i3 = i5 = 0
    while len(seq) < n:
        nxt = min(seq[i2] * 2, seq[i3] * 3, seq[i5] * 5)
        seq.append(nxt)
        if nxt == seq[i2] * 2:
            i2 += 1
        if nxt == seq[i3] * 3:
            i3 += 1
        if nxt == seq[i5] * 5:
            i5 += 1
    return seq[-1]


print([ugly(i) for i in range(1, 13)])
