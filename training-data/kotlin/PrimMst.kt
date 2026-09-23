data class WeightedEdge(val from: Int, val to: Int, val weight: Int)

fun primMst(numNodes: Int, edges: List<WeightedEdge>): Pair<List<WeightedEdge>, Int> {
    val adjacency = Array(numNodes) { mutableListOf<Pair<Int, Int>>() }
    for (edge in edges) {
        adjacency[edge.from].add(Pair(edge.to, edge.weight))
        adjacency[edge.to].add(Pair(edge.from, edge.weight))
    }

    val visited = BooleanArray(numNodes)
    visited[0] = true
    val mst = mutableListOf<WeightedEdge>()
    var totalWeight = 0

    repeat(numNodes - 1) {
        var bestWeight = Int.MAX_VALUE
        var bestFrom = -1
        var bestTo = -1

        for (u in 0 until numNodes) {
            if (!visited[u]) continue
            for ((v, w) in adjacency[u]) {
                if (!visited[v] && w < bestWeight) {
                    bestWeight = w
                    bestFrom = u
                    bestTo = v
                }
            }
        }

        if (bestTo == -1) return@repeat
        visited[bestTo] = true
        mst.add(WeightedEdge(bestFrom, bestTo, bestWeight))
        totalWeight += bestWeight
    }

    return Pair(mst, totalWeight)
}

fun main() {
    val edges = listOf(
        WeightedEdge(0, 1, 4),
        WeightedEdge(0, 2, 3),
        WeightedEdge(1, 2, 1),
        WeightedEdge(1, 3, 2),
        WeightedEdge(2, 3, 4),
        WeightedEdge(3, 4, 2),
    )
    val (mst, total) = primMst(5, edges)
    println(mst)
    println("total weight: $total")
}
