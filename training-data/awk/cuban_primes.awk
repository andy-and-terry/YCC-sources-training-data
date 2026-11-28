function is_prime(n,    i) {
    if (n < 2) return 0
    for (i = 2; i * i <= n; i++) if (n % i == 0) return 0
    return 1
}
BEGIN {
    for (y = 1; found < 8; y++) {
        p = 3 * y * y + 3 * y + 1
        if (is_prime(p)) { printf "%d ", p; found++ }
    }
    print ""
}
