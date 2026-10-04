typealias UserId = Int
typealias Predicate<T> = (T) -> Boolean
typealias Graph = Map<String, List<String>>
typealias Handler = (event: String, payload: Map<String, Any>) -> Unit

fun <T> List<T>.countMatching(p: Predicate<T>): Int = count(p)

fun reachable(graph: Graph, start: String): Set<String> {
    val seen = mutableSetOf<String>()
    val stack = ArrayDeque(listOf(start))
    while (stack.isNotEmpty()) {
        val node = stack.removeLast()
        if (seen.add(node)) stack.addAll(graph[node].orEmpty())
    }
    return seen
}

fun main() {
    val id: UserId = 42
    println(id + 1)

    val isEven: Predicate<Int> = { it % 2 == 0 }
    println(listOf(1, 2, 3, 4, 6).countMatching(isEven))

    val graph: Graph = mapOf("a" to listOf("b", "c"), "b" to listOf("d"), "c" to emptyList(), "e" to listOf("a"))
    println(reachable(graph, "a").sorted())

    val handlers = mutableListOf<Handler>()
    handlers += { event, payload -> println("log: $event $payload") }
    handlers += { event, _ -> println("count: ${event.length}") }
    handlers.forEach { it("click", mapOf("x" to 10)) }
}
