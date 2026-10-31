function cube_from_odds(n,    start, sum, i) {
    start = n * n - n + 1
    for (i = 0; i < n; i++) sum += start + 2 * i
    return sum
}
BEGIN {
    for (n = 1; n <= 5; n++)
        print n, cube_from_odds(n), (cube_from_odds(n) == n * n * n) ? "true" : "false"
}
