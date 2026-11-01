# Sum of prime factors counted with multiplicity.
function sopfr(n,   p, total) {
    total = 0
    for (p = 2; p * p <= n; p++)
        while (n % p == 0) { total += p; n = n / p }
    return total + (n > 1 ? n : 0)
}
BEGIN {
    for (n = 2; n < 110; n++)
        if (sopfr(n) == sopfr(n + 1)) printf "%d ", n
    print ""
}
