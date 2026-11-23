# n(n+1)(n+2)(n+3)/24
BEGIN {
    for (n = 1; n <= 15; n++)
        printf "%2d -> %d\n", n, int((((n * (n + 1)) * (n + 2)) * (n + 3)) / 24)
}
