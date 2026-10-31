fun cubeFromOdds(n: Long): Long {
    val start = n * n - n + 1
    return (0 until n).sumOf { start + 2 * it }
}

fun main() {
    for (n in 1L..5L) println("$n ${cubeFromOdds(n)} ${cubeFromOdds(n) == n * n * n}")
}
