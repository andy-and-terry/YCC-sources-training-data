# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
function fact(n,    f, i) { f = 1; for (i = 2; i <= n; i++) f *= i; return f }
function comb(n, k) { return fact(n) / (fact(k) * fact(n - k)) }
BEGIN {
    n = 5
    for (k = 1; k <= n; k++) printf "%d ", comb(n - 1, k - 1) * fact(n) / fact(k)
    print ""
}
