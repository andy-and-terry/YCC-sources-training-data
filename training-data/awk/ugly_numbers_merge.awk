function min3(a, b, c) { return (a < b ? (a < c ? a : c) : (b < c ? b : c)) }

BEGIN {
    n = 12
    seq[1] = 1; i2 = i3 = i5 = 1
    for (k = 2; k <= n; k++) {
        c2 = seq[i2] * 2; c3 = seq[i3] * 3; c5 = seq[i5] * 5
        next_val = min3(c2, c3, c5)
        seq[k] = next_val
        if (next_val == c2) i2++
        if (next_val == c3) i3++
        if (next_val == c5) i5++
    }
    for (k = 1; k <= n; k++) printf "%d ", seq[k]
    print ""
}
