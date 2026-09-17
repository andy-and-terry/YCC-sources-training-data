class DisjointSet(n: Int) {
    private val parent = IntArray(n) { it }
    private val rank = IntArray(n)

    fun find(x: Int): Int {
        if (parent[x] != x) parent[x] = find(parent[x])
        return parent[x]
    }

    fun union(a: Int, b: Int): Boolean {
        val rootA = find(a)
        val rootB = find(b)
        if (rootA == rootB) return false
        if (rank[rootA] < rank[rootB]) {
            parent[rootA] = rootB
        } else if (rank[rootA] > rank[rootB]) {
            parent[rootB] = rootA
        } else {
            parent[rootB] = rootA
            rank[rootA]++
        }
        return true
    }
}

data class WeightedEdge(val u: Int, val v: Int, val weight: Int)

fun kruskalMst(vertexCount: Int, edges: List<WeightedEdge>): List<WeightedEdge> {
    val sorted = edges.sortedBy { it.weight }
    val dsu = DisjointSet(vertexCount)
    val mst = mutableListOf<WeightedEdge>()
    for (edge in sorted) {
        if (dsu.union(edge.u, edge.v)) {
            mst.add(edge)
            if (mst.size == vertexCount - 1) break
        }
    }
    return mst
}

fun main() {
    val edges = listOf(
        WeightedEdge(0, 1, 4),
        WeightedEdge(0, 2, 1),
        WeightedEdge(1, 2, 2),
        WeightedEdge(1, 3, 5),
        WeightedEdge(2, 3, 8)
    )
    val mst = kruskalMst(4, edges)
    var total = 0
    for (edge in mst) {
        println("${edge.u} - ${edge.v} : ${edge.weight}")
        total += edge.weight
    }
    println("Total weight: $total")
}
