class UnionFind(n: Int) {
    private val parent = IntArray(n) { it }
    private val rank = IntArray(n)

    fun find(x: Int): Int {
        if (parent[x] != x) parent[x] = find(parent[x])
        return parent[x]
    }

    fun union(a: Int, b: Int) {
        val rootA = find(a)
        val rootB = find(b)
        if (rootA == rootB) return
        when {
            rank[rootA] < rank[rootB] -> parent[rootA] = rootB
            rank[rootA] > rank[rootB] -> parent[rootB] = rootA
            else -> { parent[rootB] = rootA; rank[rootA]++ }
        }
    }

    fun connected(a: Int, b: Int): Boolean = find(a) == find(b)
}

fun main() {
    val uf = UnionFind(6)
    uf.union(0, 1)
    uf.union(1, 2)
    println(uf.connected(0, 2))
    println(uf.connected(0, 5))
}
