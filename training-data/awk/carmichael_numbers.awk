# Carmichael numbers via Korselt's criterion: n is squarefree, composite,
# and p - 1 divides n - 1 for every prime factor p.
function is_carmichael(n,    m, p, count) {
    m = n; count = 0
    for (p = 2; p * p <= m; p++) {
        if (m % p == 0) {
            m = m / p
            if (m % p == 0) return 0          # not squarefree
            if ((n - 1) % (p - 1) != 0) return 0
            count++
        }
    }
    if (m > 1) {
        if ((n - 1) % (m - 1) != 0) return 0
        count++
    }
    return count >= 2
}
BEGIN {
    for (n = 3; n < 3000; n += 2) if (is_carmichael(n)) printf "%d ", n
    print ""
}
