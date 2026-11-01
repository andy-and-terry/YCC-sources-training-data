# Positive n expressible as a*a + b*b with a, b >= 0.
function representable(n,   a, b) {
    for (a = 0; a * a <= n; a++)
        for (b = a; a * a + b * b <= n; b++)
            if (a * a + b * b == n) return 1
    return 0
}
BEGIN {
    for (n = 1; n <= 30; n++)
        if (representable(n)) printf "%d ", n
    print ""
}
