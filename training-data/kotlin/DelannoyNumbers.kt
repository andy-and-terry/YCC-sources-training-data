fun delannoy(size: Int): Array<LongArray> {
    val d = Array(size) { LongArray(size) { 1L } }
    for (m in 1 until size) {
        for (n in 1 until size) {
            d[m][n] = d[m - 1][n] + d[m][n - 1] + d[m - 1][n - 1]
        }
    }
    return d
}

fun main() {
    val d = delannoy(10)
    println((0 until 10).joinToString(" ") { d[it][it].toString() })
}
