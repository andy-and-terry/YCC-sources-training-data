# Sophie Germain primes: p prime and 2p + 1 prime.
function is_prime(n,    d) {
    if (n < 2) return 0
    for (d = 2; d * d <= n; d++) if (n % d == 0) return 0
    return 1
}
BEGIN {
    for (p = 2; p < 100; p++) if (is_prime(p) && is_prime(2 * p + 1)) printf "%d ", p
    print ""
}
