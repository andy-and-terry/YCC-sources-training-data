#!/usr/bin/awk -f
function factorize(n,    d, out) {
    out = n ":"
    d = 2
    while (d * d <= n) {
        while (n % d == 0) {
            out = out " " d
            n /= d
        }
        d++
    }
    if (n > 1) out = out " " n
    return out
}
BEGIN {
    print factorize(360)
    print factorize(97)
}
