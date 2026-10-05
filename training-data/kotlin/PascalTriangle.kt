fun pascal(n: Int): List<List<Int>> {
    val rows = mutableListOf<List<Int>>()
    for (i in 0 until n) {
        val row = List(i + 1) { j ->
            if (j == 0 || j == i) 1 else rows[i - 1][j - 1] + rows[i - 1][j]
        }
        rows.add(row)
    }
    return rows
}

fun main() {
    pascal(6).forEach { println(it.joinToString(" ")) }
}
