fun bfsShortestPath(graph: Map<Int, List<Int>>, start: Int, target: Int): List<Int>? {
    val queue = ArrayDeque<Int>()
    val visited = mutableSetOf(start)
    val previous = mutableMapOf<Int, Int>()
    queue.add(start)

    while (queue.isNotEmpty()) {
        val node = queue.removeFirst()
        if (node == target) {
            val path = mutableListOf(target)
            var current = target
            while (current != start) {
                current = previous.getValue(current)
                path.add(current)
            }
            return path.reversed()
        }
        for (neighbor in graph[node] ?: emptyList()) {
            if (neighbor !in visited) {
                visited.add(neighbor)
                previous[neighbor] = node
                queue.add(neighbor)
            }
        }
    }
    return null
}

fun main() {
    val graph = mapOf(
        1 to listOf(2, 3),
        2 to listOf(1, 4),
        3 to listOf(1, 4),
        4 to listOf(2, 3, 5),
        5 to listOf(4),
    )
    println(bfsShortestPath(graph, 1, 5))
    println(bfsShortestPath(graph, 1, 99))
}
