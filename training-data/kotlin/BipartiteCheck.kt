fun isBipartite(graph: Map<Int, List<Int>>, numNodes: Int): Boolean {
    val color = IntArray(numNodes) { -1 }

    for (start in 0 until numNodes) {
        if (color[start] != -1) continue
        color[start] = 0
        val queue = ArrayDeque<Int>()
        queue.add(start)

        while (queue.isNotEmpty()) {
            val node = queue.removeFirst()
            for (neighbor in graph[node].orEmpty()) {
                if (color[neighbor] == -1) {
                    color[neighbor] = 1 - color[node]
                    queue.add(neighbor)
                } else if (color[neighbor] == color[node]) {
                    return false
                }
            }
        }
    }
    return true
}

fun main() {
    val evenCycle = mapOf(0 to listOf(1, 3), 1 to listOf(0, 2), 2 to listOf(1, 3), 3 to listOf(0, 2))
    println(isBipartite(evenCycle, 4))

    val oddCycle = mapOf(0 to listOf(1, 2), 1 to listOf(0, 2), 2 to listOf(0, 1))
    println(isBipartite(oddCycle, 3))
}
