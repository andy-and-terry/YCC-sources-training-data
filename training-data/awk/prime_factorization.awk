#!/usr/bin/awk -f
function factorize(n,    out, p) {
    out = ""
    for (p = 2; p * p <= n; p++)
        while (n % p == 0) {
            out = out (out == "" ? "" : " x ") p
            n = n / p
        }
    if (n > 1) out = out (out == "" ? "" : " x ") n
    return out
}
BEGIN {
    for (i = 12; i <= 100; i *= 3) print i " = " factorize(i)
    print 97 " = " factorize(97)
}
