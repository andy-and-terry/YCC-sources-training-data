function is_perfect_square(n,    r) {
    if (n < 0) return 0
    r = int(sqrt(n) + 0.5)
    return r * r == n
}

BEGIN {
    for (n = 0; n < 30; n++) if (is_perfect_square(n)) printf "%d ", n
    print ""
}
