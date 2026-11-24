// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
def mobius(int n) {
    int result = 1
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n = n.intdiv(p)
            if (n % p == 0) return 0
            result = -result
        }
    }
    return n > 1 ? -result : result
}

println((1..30).collect { mobius(it) }.join(' '))
