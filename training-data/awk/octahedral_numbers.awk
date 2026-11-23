# n(2n^2+1)/3
BEGIN {
    for (n = 1; n <= 15; n++)
        printf "%2d -> %d\n", n, int((n * (((2 * n) * n) + 1)) / 3)
}
