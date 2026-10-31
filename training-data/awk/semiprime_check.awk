function prime_factor_count(n,    count, p) {
    for (p = 2; p * p <= n; p++)
        while (n % p == 0) { n /= p; count++ }
    if (n > 1) count++
    return count + 0
}
BEGIN {
    for (n = 2; n < 30; n++)
        if (prime_factor_count(n) == 2) printf "%d ", n
    print ""
}
