#!/usr/bin/awk -f
function lucas_lehmer(p,    m, s, i) {
    if (p == 2) return 1
    m = 2 ^ p - 1
    s = 4
    for (i = 0; i < p - 2; i++)
        s = (s * s - 2) % m
    return s == 0
}
BEGIN {
    split("2 3 5 7 11 13 17 19", ps, " ")
    for (i = 1; i <= 8; i++)
        if (lucas_lehmer(ps[i])) out = out (out == "" ? "" : " ") ps[i]
    print out
}
