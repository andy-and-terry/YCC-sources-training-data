function is_prime(n,    i) {
    if (n < 2) return 0
    for (i = 2; i * i <= n; i++) if (n % i == 0) return 0
    return 1
}
function rev(n,    r) {
    while (n > 0) { r = r * 10 + n % 10; n = int(n / 10) }
    return r
}
BEGIN {
    for (p = 2; p < 100; p++)
        if (is_prime(p) && rev(p) != p && is_prime(rev(p))) printf "%d ", p
    print ""
}
