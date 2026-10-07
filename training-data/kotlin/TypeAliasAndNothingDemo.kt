typealias Predicate<T> = (T) -> Boolean
typealias Graph = Map<String, List<String>>
typealias Handler = (event: String, payload: Any?) -> Unit

fun <T> List<T>.countMatching(p: Predicate<T>): Int = count(p)

fun neighbors(g: Graph, node: String): List<String> = g[node].orEmpty()

fun fail(message: String): Nothing {
    throw IllegalStateException(message)
}

fun parsePositive(s: String): Int {
    val n = s.toIntOrNull() ?: fail("not a number: $s")
    if (n <= 0) fail("not positive: $n")
    return n
}

fun main() {
    val isEven: Predicate<Int> = { it % 2 == 0 }
    println(listOf(1, 2, 3, 4, 6).countMatching(isEven))

    val g: Graph = mapOf("a" to listOf("b", "c"), "b" to listOf("c"))
    println(neighbors(g, "a"))
    println(neighbors(g, "z"))

    val handler: Handler = { event, payload -> println("$event -> $payload") }
    handler("click", 42)

    println(parsePositive("12"))
    for (bad in listOf("x", "-3")) {
        try {
            parsePositive(bad)
        } catch (e: IllegalStateException) {
            println("error: ${e.message}")
        }
    }
}
