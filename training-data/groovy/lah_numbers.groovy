// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
long fact(int n) { n <= 1 ? 1L : n * fact(n - 1) }
long comb(int n, int k) { fact(n).intdiv(fact(k) * fact(n - k)) }

int n = 5
println((1..n).collect { k -> (comb(n - 1, k - 1) * fact(n)).intdiv(fact(k)) }.join(' '))
