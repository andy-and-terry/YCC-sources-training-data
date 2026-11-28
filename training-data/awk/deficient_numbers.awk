#!/usr/bin/awk -f
function sigma(n,    d, s) {
    for (d = 1; d <= n; d++) if (n % d == 0) s += d
    return s
}
BEGIN {
    for (n = 1; n <= 20; n++) if (sigma(n) < 2 * n) printf "%d ", n
    print ""
}
