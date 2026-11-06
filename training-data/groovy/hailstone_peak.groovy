// Highest value reached by the Collatz (hailstone) sequence from n.
long peak(long n) {
    long best = n
    while (n != 1) {
        n = n % 2 == 0 ? n.intdiv(2) : 3 * n + 1
        best = Math.max(best, n)
    }
    best
}

println peak(27)
