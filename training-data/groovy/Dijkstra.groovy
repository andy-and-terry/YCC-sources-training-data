def dijkstra(graph, source) {
    def dist = [:].withDefault { Integer.MAX_VALUE }
    dist[source] = 0
    def visited = [] as Set

    graph.keySet().size().times {
        def candidate = dist.findAll { !visited.contains(it.key) }
            .min { it.value }
        if (candidate == null) return
        def node = candidate.key
        visited << node
        (graph[node] ?: []).each { edge ->
            def (neighbor, weight) = edge
            int newDist = dist[node] + weight
            if (newDist < dist[neighbor]) dist[neighbor] = newDist
        }
    }
    return dist
}

def graph = [
    'a': [['b', 1], ['c', 4]],
    'b': [['c', 2], ['d', 5]],
    'c': [['d', 1]],
    'd': []
]
println dijkstra(graph, 'a')
