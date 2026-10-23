#!/usr/bin/awk -f
function digit_sum(n,    s) {
    while (n > 0) {
        s += n % 10
        n = int(n / 10)
    }
    return s
}
function is_smith(n,    m, p, sum) {
    m = n
    for (p = 2; p * p <= m; p++)
        while (m % p == 0) {
            sum += digit_sum(p)
            m = int(m / p)
        }
    if (m == n) return 0
    if (m > 1) sum += digit_sum(m)
    return sum == digit_sum(n)
}
BEGIN {
    for (i = 2; i < 100; i++)
        if (is_smith(i)) out = out (out == "" ? "" : " ") i
    print out
}
