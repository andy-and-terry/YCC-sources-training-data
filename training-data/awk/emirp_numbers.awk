# Emirps: primes whose digit reversal is a different prime.
function is_prime(n,    d) {
    if (n < 2) return 0
    for (d = 2; d * d <= n; d++) if (n % d == 0) return 0
    return 1
}
function reverse(n,    s, r, i) {
    s = n ""; r = ""
    for (i = length(s); i >= 1; i--) r = r substr(s, i, 1)
    return r + 0
}
BEGIN {
    for (n = 2; n < 200; n++) {
        r = reverse(n)
        if (r != n && is_prime(n) && is_prime(r)) printf "%d ", n
    }
    print ""
}
