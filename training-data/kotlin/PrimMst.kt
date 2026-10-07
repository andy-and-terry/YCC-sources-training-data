fun primMst(graph: Map<Int, List<Pair<Int, Int>>>, start: Int): List<Triple<Int, Int, Int>> {
    val visited = mutableSetOf(start)
    val mst = mutableListOf<Triple<Int, Int, Int>>()
    val edgesAvailable = graph.size - 1

    while (mst.size < edgesAvailable) {
        var best: Triple<Int, Int, Int>? = null
        for (u in visited) {
            for ((v, weight) in graph[u] ?: emptyList()) {
                if (v !in visited && (best == null || weight < best.third)) {
                    best = Triple(u, v, weight)
                }
            }
        }
        best ?: break
        mst.add(best)
        visited.add(best.second)
    }
    return mst
}

fun main() {
    val graph = mapOf(
        0 to listOf(1 to 2, 3 to 6),
        1 to listOf(0 to 2, 2 to 3, 3 to 8, 4 to 5),
        2 to listOf(1 to 3, 4 to 7),
        3 to listOf(0 to 6, 1 to 8, 4 to 9),
        4 to listOf(1 to 5, 2 to 7, 3 to 9)
    )
    val mst = primMst(graph, 0)
    mst.forEach { (u, v, w) -> println("$u - $v : $w") }
    println("total weight: ${mst.sumOf { it.third }}")
}
