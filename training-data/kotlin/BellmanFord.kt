data class Edge(val from: String, val to: String, val weight: Int)

fun bellmanFord(nodes: List<String>, edges: List<Edge>, source: String): Map<String, Int> {
    val dist = nodes.associateWith { Int.MAX_VALUE }.toMutableMap()
    dist[source] = 0

    for (i in 1 until nodes.size) {
        for (edge in edges) {
            val du = dist[edge.from] ?: continue
            if (du != Int.MAX_VALUE && du + edge.weight < (dist[edge.to] ?: Int.MAX_VALUE)) {
                dist[edge.to] = du + edge.weight
            }
        }
    }

    for (edge in edges) {
        val du = dist[edge.from] ?: continue
        if (du != Int.MAX_VALUE && du + edge.weight < (dist[edge.to] ?: Int.MAX_VALUE)) {
            error("Graph contains a negative-weight cycle")
        }
    }
    return dist
}

fun main() {
    val nodes = listOf("A", "B", "C", "D")
    val edges = listOf(
        Edge("A", "B", 4),
        Edge("A", "C", 5),
        Edge("B", "C", -3),
        Edge("C", "D", 4),
        Edge("B", "D", 6)
    )
    bellmanFord(nodes, edges, "A").toSortedMap().forEach { (k, v) -> println("$k: $v") }
}
