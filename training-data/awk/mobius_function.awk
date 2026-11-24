# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
function mobius(n,   result, p) {
    result = 1
    for (p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n = int(n / p)
            if (n % p == 0) return 0
            result = -result
        }
    }
    return (n > 1) ? -result : result
}

BEGIN {
    for (i = 1; i <= 30; i++) printf "%d%s", mobius(i), (i < 30 ? " " : "\n")
}
