class GraphNode(val value: Int) {
    val neighbors = mutableListOf<GraphNode>()
}

fun cloneGraph(node: GraphNode, seen: MutableMap<GraphNode, GraphNode> = HashMap()): GraphNode {
    seen[node]?.let { return it }
    val copy = GraphNode(node.value)
    seen[node] = copy
    node.neighbors.forEach { copy.neighbors += cloneGraph(it, seen) }
    return copy
}

fun main() {
    val a = GraphNode(1)
    val b = GraphNode(2)
    val c = GraphNode(3)
    a.neighbors += listOf(b, c)
    b.neighbors += c
    c.neighbors += a

    val copy = cloneGraph(a)
    println(copy !== a)
    println(copy.neighbors.map { it.value })
    println(copy.neighbors[1].neighbors[0] === copy)
}
