fun <T> List<List<T>>.rotateClockwise(): List<List<T>> =
    first().indices.map { c -> indices.reversed().map { r -> this[r][c] } }

fun main() {
    val m = listOf(listOf(1, 2, 3), listOf(4, 5, 6), listOf(7, 8, 9))
    m.rotateClockwise().forEach(::println)
}
