class DisjointSet(n: Int) {
    private val parent = IntArray(n) { it }

    fun find(x: Int): Int {
        if (parent[x] != x) parent[x] = find(parent[x])
        return parent[x]
    }

    fun union(a: Int, b: Int): Boolean {
        val rootA = find(a)
        val rootB = find(b)
        if (rootA == rootB) return false
        parent[rootA] = rootB
        return true
    }
}

data class Edge(val from: Int, val to: Int, val weight: Int)

fun kruskalMst(vertexCount: Int, edges: List<Edge>): List<Edge> {
    val disjointSet = DisjointSet(vertexCount)
    val mst = mutableListOf<Edge>()

    for (edge in edges.sortedBy { it.weight }) {
        if (disjointSet.union(edge.from, edge.to)) {
            mst.add(edge)
        }
    }
    return mst
}

fun main() {
    val edges = listOf(
        Edge(0, 1, 4),
        Edge(0, 2, 3),
        Edge(1, 2, 1),
        Edge(1, 3, 2),
        Edge(2, 3, 4),
        Edge(3, 4, 2),
        Edge(4, 2, 4),
    )
    val mst = kruskalMst(5, edges)
    println(mst)
    println("total weight: ${mst.sumOf { it.weight }}")
}
