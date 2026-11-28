function lah(n, k,    c, f, i) {
    c = 1; f = 1
    for (i = 0; i < k - 1; i++) c = c * (n - 1 - i) / (i + 1)
    for (i = k + 1; i <= n; i++) f *= i
    return c * f
}
BEGIN {
    for (n = 1; n <= 5; n++) {
        for (k = 1; k <= n; k++) printf "%d ", lah(n, k)
        print ""
    }
}
