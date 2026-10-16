fun isValidSudoku(board: Array<CharArray>): Boolean {
    val seen = HashSet<String>()
    for (r in 0 until 9) {
        for (c in 0 until 9) {
            val v = board[r][c]
            if (v == '.') continue
            val keys = listOf("r$r$v", "c$c$v", "b${r / 3}${c / 3}$v")
            if (keys.any { it in seen }) return false
            seen.addAll(keys)
        }
    }
    return true
}

fun main() {
    val board = Array(9) { CharArray(9) { '.' } }
    board[0][0] = '5'
    board[1][1] = '5'
    println(isValidSudoku(board))
    board[1][1] = '6'
    println(isValidSudoku(board))
}
