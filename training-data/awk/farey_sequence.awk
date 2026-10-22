#!/usr/bin/awk -f
function farey(n,    a, b, c, d, k, t, out) {
    a = 0; b = 1; c = 1; d = n
    out = "0/1"
    while (c <= n) {
        out = out " " c "/" d
        k = int((n + b) / d)
        t = c; c = k * c - a; a = t
        t = d; d = k * d - b; b = t
    }
    return out
}
BEGIN {
    print farey(5)
}
