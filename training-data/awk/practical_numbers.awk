# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
function is_practical(n,    d, m, reach, nr, r) {
    delete reach
    reach[0] = 1
    for (d = 1; d <= n; d++) {
        if (n % d) continue
        for (r in reach) nr[r + d] = 1
        for (r in nr) reach[r] = 1
        delete nr
    }
    for (m = 1; m <= n; m++) if (!(m in reach)) return 0
    return 1
}
BEGIN {
    for (n = 1; n <= 40; n++) if (is_practical(n)) printf "%d ", n
    print ""
}
