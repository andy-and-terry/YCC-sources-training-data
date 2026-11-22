# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
function is_prime(n,    d) {
    if (n < 2) return 0
    for (d = 2; d * d <= n; d++) if (n % d == 0) return 0
    return 1
}
BEGIN {
    for (p = 2; p < 100; p++) if (is_prime(p) && is_prime(p + 2)) printf "%d ", p
    print ""
}
