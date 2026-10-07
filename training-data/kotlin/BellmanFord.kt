data class Edge(val from: String, val to: String, val weight: Int)

fun bellmanFord(vertices: List<String>, edges: List<Edge>, source: String): Map<String, Int> {
    val dist = vertices.associateWith { Int.MAX_VALUE }.toMutableMap()
    dist[source] = 0

    repeat(vertices.size - 1) {
        for (edge in edges) {
            val du = dist[edge.from] ?: Int.MAX_VALUE
            if (du != Int.MAX_VALUE && du + edge.weight < (dist[edge.to] ?: Int.MAX_VALUE)) {
                dist[edge.to] = du + edge.weight
            }
        }
    }

    for (edge in edges) {
        val du = dist[edge.from] ?: Int.MAX_VALUE
        if (du != Int.MAX_VALUE && du + edge.weight < (dist[edge.to] ?: Int.MAX_VALUE)) {
            println("negative weight cycle detected")
        }
    }

    return dist
}

fun main() {
    val vertices = listOf("A", "B", "C", "D")
    val edges = listOf(
        Edge("A", "B", 4),
        Edge("A", "C", 1),
        Edge("C", "B", 2),
        Edge("B", "D", 1),
        Edge("C", "D", 5)
    )
    bellmanFord(vertices, edges, "A").toSortedMap().forEach { (k, v) -> println("$k: $v") }
}
