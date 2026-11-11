// Highest value reached by the Collatz (hailstone) sequence from n.
func peak(_ start: Int) -> Int {
    var n = start, best = start
    while n != 1 {
        n = n % 2 == 0 ? n / 2 : 3 * n + 1
        best = max(best, n)
    }
    return best
}

print(peak(27))
