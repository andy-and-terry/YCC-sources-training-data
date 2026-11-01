# Ways to write n as a sum of two or more consecutive positive integers.
function polite_ways(n,   k, ways) {
    ways = 0
    for (k = 2; k * (k + 1) / 2 <= n; k++)
        if ((n - k * (k - 1) / 2) % k == 0) ways++
    return ways
}
BEGIN {
    for (n = 1; n <= 16; n++) printf "%d ", polite_ways(n)
    print ""
}
