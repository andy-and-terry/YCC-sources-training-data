// Highest value reached by the Collatz (hailstone) sequence from n.
fun peak(start: Long): Long {
    var n = start
    var best = n
    while (n != 1L) {
        n = if (n % 2 == 0L) n / 2 else 3 * n + 1
        best = maxOf(best, n)
    }
    return best
}

fun main() {
    println(peak(27))
}
