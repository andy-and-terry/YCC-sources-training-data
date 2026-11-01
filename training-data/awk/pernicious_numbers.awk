# Pernicious numbers: the popcount is prime.
function is_prime(n,   d) {
    if (n < 2) return 0
    for (d = 2; d * d <= n; d++) if (n % d == 0) return 0
    return 1
}
function popcount(n,   c) {
    for (c = 0; n > 0; n = int(n / 2)) c += n % 2
    return c
}
BEGIN {
    for (n = 1; n <= 20; n++)
        if (is_prime(popcount(n))) printf "%d ", n
    print ""
}
