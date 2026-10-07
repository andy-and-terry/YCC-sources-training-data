#!/usr/bin/awk -f
function is_perfect(n,    s, d) {
    s = 1
    for (d = 2; d * d <= n; d++)
        if (n % d == 0) {
            s += d
            if (d != n / d) s += n / d
        }
    return n > 1 && s == n
}
BEGIN {
    for (i = 1; i <= 1000; i++) if (is_perfect(i)) print i
}
