data class Edge(val from: Int, val to: Int, val weight: Int)

fun bellmanFord(numNodes: Int, edges: List<Edge>, source: Int): Pair<IntArray, Boolean> {
    val dist = IntArray(numNodes) { Int.MAX_VALUE }
    dist[source] = 0

    for (i in 1 until numNodes) {
        for (edge in edges) {
            if (dist[edge.from] != Int.MAX_VALUE && dist[edge.from] + edge.weight < dist[edge.to]) {
                dist[edge.to] = dist[edge.from] + edge.weight
            }
        }
    }

    var hasNegativeCycle = false
    for (edge in edges) {
        if (dist[edge.from] != Int.MAX_VALUE && dist[edge.from] + edge.weight < dist[edge.to]) {
            hasNegativeCycle = true
        }
    }

    return Pair(dist, hasNegativeCycle)
}

fun main() {
    val edges = listOf(
        Edge(0, 1, 4),
        Edge(0, 2, 5),
        Edge(1, 2, -3),
        Edge(2, 3, 4),
        Edge(1, 3, 6),
    )
    val (dist, hasNegativeCycle) = bellmanFord(4, edges, 0)
    println(dist.toList())
    println("negative cycle: $hasNegativeCycle")
}
