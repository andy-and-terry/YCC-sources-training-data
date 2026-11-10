fun centralDelannoy(n: Int): Long {
    val g = Array(n + 1) { LongArray(n + 1) { 1L } }
    for (i in 1..n) for (j in 1..n) g[i][j] = g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1]
    return g[n][n]
}

fun main() {
    println((0..5).joinToString(" ") { centralDelannoy(it).toString() }) // 1 3 13 63 321 1683
}
