typealias Predicate<T> = (T) -> Boolean
typealias Graph = Map<Int, List<Int>>

fun <T> List<T>.countMatching(p: Predicate<T>): Int = count(p)

fun degree(g: Graph, node: Int): Int = g[node]?.size ?: 0

fun fail(message: String): Nothing = throw IllegalStateException(message)

fun parsePositive(s: String): Int {
    val n = s.toIntOrNull() ?: fail("not a number: $s")
    return if (n > 0) n else fail("not positive: $n")
}

fun main() {
    val isEven: Predicate<Int> = { it % 2 == 0 }
    println(listOf(1, 2, 3, 4).countMatching(isEven))
    val g: Graph = mapOf(1 to listOf(2, 3), 2 to listOf(3))
    println(degree(g, 1))
    println(parsePositive("42"))
    runCatching { parsePositive("-3") }.onFailure { println(it.message) }
}
