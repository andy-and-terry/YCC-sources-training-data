data class Edge(val from: Int, val to: Int, val weight: Int)

fun bellmanFord(numNodes: Int, edges: List<Edge>, source: Int): IntArray {
    val dist = IntArray(numNodes) { Int.MAX_VALUE }
    dist[source] = 0

    for (i in 0 until numNodes - 1) {
        for (edge in edges) {
            if (dist[edge.from] != Int.MAX_VALUE && dist[edge.from] + edge.weight < dist[edge.to]) {
                dist[edge.to] = dist[edge.from] + edge.weight
            }
        }
    }

    for (edge in edges) {
        if (dist[edge.from] != Int.MAX_VALUE && dist[edge.from] + edge.weight < dist[edge.to]) {
            throw IllegalStateException("graph contains a negative-weight cycle")
        }
    }

    return dist
}

fun main() {
    val edges = listOf(
        Edge(0, 1, 4),
        Edge(0, 2, 5),
        Edge(1, 2, -3),
        Edge(2, 3, 4)
    )
    println(bellmanFord(4, edges, 0).toList())
}
