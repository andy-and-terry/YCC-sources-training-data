# n^2(n+1)/2
BEGIN {
    for (n = 1; n <= 15; n++)
        printf "%2d -> %d\n", n, int(((n * n) * (n + 1)) / 2)
}
