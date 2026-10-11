#!/usr/bin/awk -f
function dot(a, b, n,   i, s) {
    for (i = 1; i <= n; i++) s += a[i] * b[i]
    return s
}
BEGIN {
    n = split("1 2 3", u, " ")
    split("4 5 6", v, " ")
    print dot(u, v, n)
}
