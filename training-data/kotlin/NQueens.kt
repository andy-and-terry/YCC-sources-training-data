fun solveNQueens(n: Int): List<List<Int>> {
    val solutions = mutableListOf<List<Int>>()
    val columns = IntArray(n)

    fun isSafe(row: Int, col: Int): Boolean {
        for (r in 0 until row) {
            val c = columns[r]
            if (c == col || Math.abs(c - col) == Math.abs(r - row)) return false
        }
        return true
    }

    fun backtrack(row: Int) {
        if (row == n) {
            solutions.add(columns.toList())
            return
        }
        for (col in 0 until n) {
            if (isSafe(row, col)) {
                columns[row] = col
                backtrack(row + 1)
            }
        }
    }

    backtrack(0)
    return solutions
}

fun main() {
    val solutions = solveNQueens(4)
    println("solutions: ${solutions.size}")
    solutions.forEach { println(it) }
}
