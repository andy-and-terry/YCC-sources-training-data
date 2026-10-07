data class Cell(val row: Int, val col: Int)

fun saddlePoints(m: List<List<Int>>): List<Cell> {
    if (m.isEmpty()) return emptyList()
    val colMin = m[0].indices.map { c -> m.minOf { it[c] } }
    return m.flatMapIndexed { r, row ->
        val rowMax = row.max()
        row.indices.filter { c -> row[c] == rowMax && row[c] == colMin[c] }.map { Cell(r, it) }
    }
}

fun main() = println(saddlePoints(listOf(listOf(9, 8, 7), listOf(5, 3, 2), listOf(6, 6, 7))))
