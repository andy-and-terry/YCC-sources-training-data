fun spiral(n: Int): Array<IntArray> {
    val g = Array(n) { IntArray(n) }
    val dirs = listOf(0 to 1, 1 to 0, 0 to -1, -1 to 0)
    var r = 0; var c = 0; var d = 0
    for (k in 1..n * n) {
        g[r][c] = k
        val nr = r + dirs[d].first
        val nc = c + dirs[d].second
        if (nr !in 0 until n || nc !in 0 until n || g[nr][nc] != 0) d = (d + 1) % 4
        r += dirs[d].first
        c += dirs[d].second
    }
    return g
}

fun main() {
    spiral(4).forEach { row -> println(row.joinToString(" ") { it.toString().padStart(2) }) }
}
