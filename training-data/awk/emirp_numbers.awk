# Emirps: primes whose digit reversal is a different prime.
function is_prime(n,    i) {
    if (n < 2) return 0
    for (i = 2; i * i <= n; i++) if (n % i == 0) return 0
    return 1
}

function reverse(n,    s, r, i) {
    s = n ""
    for (i = length(s); i >= 1; i--) r = r substr(s, i, 1)
    return r + 0
}

BEGIN {
    for (n = 2; n < 100; n++) {
        r = reverse(n)
        if (r != n && is_prime(n) && is_prime(r)) printf "%d ", n
    }
    print ""
}
