// Ways to write n as a sum of two or more consecutive positive integers.
int politeWays(int n) {
    int ways = 0
    for (int k = 2; k * (k + 1) / 2 <= n; k++) {
        if ((n - (k * (k - 1)).intdiv(2)) % k == 0) ways++
    }
    return ways
}

println((1..16).collect { politeWays(it) }.join(' '))
