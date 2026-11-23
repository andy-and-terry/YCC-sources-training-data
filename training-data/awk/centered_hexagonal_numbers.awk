# 3n(n-1)+1
BEGIN {
    for (n = 1; n <= 15; n++)
        printf "%2d -> %d\n", n, int(((3 * n) * (n - 1)) + 1)
}
