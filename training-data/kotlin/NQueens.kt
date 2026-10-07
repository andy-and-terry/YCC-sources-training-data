fun isSafe(queens: IntArray, row: Int, col: Int): Boolean {
    for (r in 0 until row) {
        val c = queens[r]
        if (c == col || Math.abs(c - col) == row - r) return false
    }
    return true
}

fun solve(queens: IntArray, row: Int, n: Int): Int {
    if (row == n) return 1
    var count = 0
    for (col in 0 until n) {
        if (isSafe(queens, row, col)) {
            queens[row] = col
            count += solve(queens, row + 1, n)
        }
    }
    return count
}

fun main() {
    val n = 6
    val solutions = solve(IntArray(n), 0, n)
    println("solutions for $n-queens: $solutions")
}
