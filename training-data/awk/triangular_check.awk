# n is triangular iff 8n + 1 is a perfect square.
function is_triangular(n,   s, r) {
    s = 8 * n + 1
    r = int(sqrt(s) + 0.5)
    return r * r == s
}
BEGIN {
    for (n = 0; n <= 20; n++)
        if (is_triangular(n)) printf "%d ", n
    print ""
}
