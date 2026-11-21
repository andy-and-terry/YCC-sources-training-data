# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
function gcd(a, b,    t) { while (b) { t = a % b; a = b; b = t } return a }
function phi(n,    c, k) {
    c = 0
    for (k = 1; k <= n; k++) if (gcd(k, n) == 1) c++
    return c
}
function is_perfect_totient(n,    total, m) {
    total = 0
    for (m = n; m > 1; ) { m = phi(m); total += m }
    return total == n
}
BEGIN {
    for (n = 2; n < 200; n++) if (is_perfect_totient(n)) printf "%d ", n
    print ""
}
