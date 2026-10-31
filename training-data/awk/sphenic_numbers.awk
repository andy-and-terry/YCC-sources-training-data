function is_sphenic(n,    distinct, p) {
    for (p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n /= p
            if (n % p == 0) return 0
            distinct++
        }
    }
    if (n > 1) distinct++
    return distinct == 3
}
BEGIN {
    for (n = 2; n < 80; n++)
        if (is_sphenic(n)) printf "%d ", n
    print ""
}
