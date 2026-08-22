fun topologicalSort(graph: Map<Int, List<Int>>, nodeCount: Int): List<Int> {
    val inDegree = IntArray(nodeCount)
    for ((_, neighbors) in graph) {
        for (n in neighbors) inDegree[n]++
    }
    val queue = ArrayDeque((0 until nodeCount).filter { inDegree[it] == 0 })
    val result = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.removeFirst()
        result.add(node)
        for (neighbor in graph[node] ?: emptyList()) {
            inDegree[neighbor]--
            if (inDegree[neighbor] == 0) queue.addLast(neighbor)
        }
    }
    return result
}

fun main() {
    val graph = mapOf(0 to listOf(1, 2), 1 to listOf(3), 2 to listOf(3), 3 to emptyList())
    println(topologicalSort(graph, 4))
}
