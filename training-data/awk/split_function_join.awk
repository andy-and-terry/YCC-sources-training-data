function join(a, n, sep,   i, s) {
    for (i = 1; i <= n; i++) s = s (i > 1 ? sep : "") a[i]
    return s
}
{ n = split($0, parts, " "); print join(parts, n, "-") }
