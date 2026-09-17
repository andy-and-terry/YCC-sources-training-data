fun hasCycle(graph: Map<Int, List<Int>>): Boolean {
    val visited = mutableSetOf<Int>()
    val inStack = mutableSetOf<Int>()

    fun dfs(node: Int): Boolean {
        visited.add(node)
        inStack.add(node)
        for (neighbor in graph[node] ?: emptyList()) {
            if (neighbor !in visited) {
                if (dfs(neighbor)) return true
            } else if (neighbor in inStack) {
                return true
            }
        }
        inStack.remove(node)
        return false
    }

    for (node in graph.keys) {
        if (node !in visited) {
            if (dfs(node)) return true
        }
    }
    return false
}

fun main() {
    val acyclic = mapOf(0 to listOf(1), 1 to listOf(2), 2 to listOf<Int>())
    val cyclic = mapOf(0 to listOf(1), 1 to listOf(2), 2 to listOf(0))
    println(hasCycle(acyclic))
    println(hasCycle(cyclic))
}
