typealias Predicate<T> = (T) -> Boolean
typealias Graph = Map<String, List<String>>
typealias Handler = (event: String, payload: Map<String, Any>) -> Unit

fun <T> List<T>.countMatching(p: Predicate<T>): Int = count(p)

fun reachable(g: Graph, start: String): Set<String> {
    val seen = mutableSetOf<String>()
    val stack = ArrayDeque(listOf(start))
    while (stack.isNotEmpty()) {
        val n = stack.removeLast()
        if (seen.add(n)) stack.addAll(g[n].orEmpty())
    }
    return seen
}

fun main() {
    val isEven: Predicate<Int> = { it % 2 == 0 }
    println(listOf(1, 2, 3, 4, 6).countMatching(isEven))

    val g: Graph = mapOf("a" to listOf("b", "c"), "b" to listOf("d"), "c" to emptyList())
    println(reachable(g, "a").sorted())

    val log: Handler = { event, payload -> println("$event -> $payload") }
    log("click", mapOf("x" to 1, "y" to 2))
}
