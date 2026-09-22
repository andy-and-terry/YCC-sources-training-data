fun numIslands(grid: Array<IntArray>): Int {
    val rows = grid.size
    val cols = grid[0].size
    val visited = Array(rows) { BooleanArray(cols) }

    fun flood(startRow: Int, startCol: Int) {
        val stack = ArrayDeque<Pair<Int, Int>>()
        stack.addLast(startRow to startCol)
        while (stack.isNotEmpty()) {
            val (r, c) = stack.removeLast()
            if (r < 0 || r >= rows || c < 0 || c >= cols) continue
            if (visited[r][c] || grid[r][c] == 0) continue
            visited[r][c] = true
            stack.addLast((r + 1) to c)
            stack.addLast((r - 1) to c)
            stack.addLast(r to (c + 1))
            stack.addLast(r to (c - 1))
        }
    }

    var count = 0
    for (r in 0 until rows) {
        for (c in 0 until cols) {
            if (grid[r][c] == 1 && !visited[r][c]) {
                flood(r, c)
                count++
            }
        }
    }
    return count
}

fun main() {
    val grid = arrayOf(
        intArrayOf(1, 1, 0, 0, 0),
        intArrayOf(1, 1, 0, 0, 0),
        intArrayOf(0, 0, 1, 0, 0),
        intArrayOf(0, 0, 0, 1, 1)
    )
    println(numIslands(grid))
}
