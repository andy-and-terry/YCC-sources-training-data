fun dijkstra(graph: Map<String, Map<String, Int>>, source: String): Map<String, Int> {
    val dist = graph.keys.associateWith { Int.MAX_VALUE }.toMutableMap()
    dist[source] = 0
    val visited = mutableSetOf<String>()

    while (visited.size < graph.size) {
        val u = dist.filterKeys { it !in visited }.minByOrNull { it.value }?.key ?: break
        visited.add(u)
        for ((neighbor, weight) in graph[u] ?: emptyMap()) {
            val alt = dist[u]!! + weight
            if (alt < dist[neighbor]!!) dist[neighbor] = alt
        }
    }
    return dist
}

fun main() {
    val graph = mapOf(
        "A" to mapOf("B" to 4, "C" to 1),
        "B" to mapOf("A" to 4, "C" to 2, "D" to 5),
        "C" to mapOf("A" to 1, "B" to 2, "D" to 8),
        "D" to mapOf("B" to 5, "C" to 8)
    )
    dijkstra(graph, "A").toSortedMap().forEach { (k, v) -> println("$k: $v") }
}
