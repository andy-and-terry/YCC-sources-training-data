class DisjointSet {
    Map<String, String> parent = [:]

    void makeSet(String v) { parent[v] = v }

    String find(String v) {
        if (parent[v] != v) parent[v] = find(parent[v])
        return parent[v]
    }

    boolean union(String a, String b) {
        def rootA = find(a)
        def rootB = find(b)
        if (rootA == rootB) return false
        parent[rootA] = rootB
        return true
    }
}

def kruskal(List<String> nodes, List<List<Object>> edges) {
    def ds = new DisjointSet()
    nodes.each { ds.makeSet(it) }

    def sortedEdges = edges.sort { it[2] }
    def mst = []
    int totalWeight = 0

    sortedEdges.each { edge ->
        def (u, v, w) = edge
        if (ds.union(u, v)) {
            mst << edge
            totalWeight += w
        }
    }
    return [mst: mst, totalWeight: totalWeight]
}

def nodes = ['a', 'b', 'c', 'd']
def edges = [
    ['a', 'b', 1],
    ['a', 'c', 4],
    ['b', 'c', 2],
    ['b', 'd', 5],
    ['c', 'd', 1]
]

def result = kruskal(nodes, edges)
println result.totalWeight
result.mst.each { println it }
