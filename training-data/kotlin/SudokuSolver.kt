fun isValid(board: Array<IntArray>, row: Int, col: Int, num: Int): Boolean {
    for (i in 0 until 9) {
        if (board[row][i] == num || board[i][col] == num) return false
    }
    val boxRow = row - row % 3
    val boxCol = col - col % 3
    for (i in 0 until 3) {
        for (j in 0 until 3) {
            if (board[boxRow + i][boxCol + j] == num) return false
        }
    }
    return true
}

fun solve(board: Array<IntArray>): Boolean {
    for (row in 0 until 9) {
        for (col in 0 until 9) {
            if (board[row][col] == 0) {
                for (num in 1..9) {
                    if (isValid(board, row, col, num)) {
                        board[row][col] = num
                        if (solve(board)) return true
                        board[row][col] = 0
                    }
                }
                return false
            }
        }
    }
    return true
}

fun main() {
    val board = arrayOf(
        intArrayOf(5, 3, 0, 0, 7, 0, 0, 0, 0),
        intArrayOf(6, 0, 0, 1, 9, 5, 0, 0, 0),
        intArrayOf(0, 9, 8, 0, 0, 0, 0, 6, 0),
        intArrayOf(8, 0, 0, 0, 6, 0, 0, 0, 3),
        intArrayOf(4, 0, 0, 8, 0, 3, 0, 0, 1),
        intArrayOf(7, 0, 0, 0, 2, 0, 0, 0, 6),
        intArrayOf(0, 6, 0, 0, 0, 0, 2, 8, 0),
        intArrayOf(0, 0, 0, 4, 1, 9, 0, 0, 5),
        intArrayOf(0, 0, 0, 0, 8, 0, 0, 7, 9)
    )

    if (solve(board)) {
        board.forEach { println(it.joinToString(" ")) }
    } else {
        println("no solution")
    }
}
