function is_powerful(n,    p) {
    for (p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            if (n % (p * p) != 0) return 0
            while (n % p == 0) n /= p
        }
    }
    return n == 1
}
BEGIN {
    for (n = 1; n <= 100; n++)
        if (is_powerful(n)) printf "%d ", n
    print ""
}
