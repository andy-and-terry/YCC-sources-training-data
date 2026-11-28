#!/usr/bin/awk -f
function abs(x) { return x < 0 ? -x : x }
BEGIN {
    n = split("1 2", a, " "); split("4 6", b, " ")
    for (i = 1; i <= n; i++) s += abs(a[i] - b[i])
    print s
}
