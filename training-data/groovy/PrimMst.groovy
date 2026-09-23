def prim(Map<String, List<List<Object>>> graph, String start) {
    def visited = [] as Set
    def totalWeight = 0
    def edges = []
    visited << start

    while (visited.size() < graph.keySet().size()) {
        def best = null
        visited.each { node ->
            (graph[node] ?: []).each { edge ->
                def (neighbor, weight) = edge
                if (!visited.contains(neighbor)) {
                    if (best == null || weight < best[2]) {
                        best = [node, neighbor, weight]
                    }
                }
            }
        }
        if (best == null) return
        visited << best[1]
        edges << best
        totalWeight += best[2]
    }
    return [edges: edges, totalWeight: totalWeight]
}

def graph = [
    'a': [['b', 1], ['c', 4]],
    'b': [['a', 1], ['c', 2], ['d', 5]],
    'c': [['a', 4], ['b', 2], ['d', 1]],
    'd': [['b', 5], ['c', 1]]
]

def result = prim(graph, 'a')
println result.totalWeight
result.edges.each { println it }
