func dijkstra(_ graph: [String: [String: Int]], source: String) -> [String: Int] {
    var dist: [String: Int] = [:]
    for node in graph.keys { dist[node] = Int.max }
    dist[source] = 0
    var visited = Set<String>()

    while visited.count < graph.count {
        var u: String? = nil
        var best = Int.max
        for (node, d) in dist where !visited.contains(node) && d < best {
            best = d
            u = node
        }
        guard let current = u else { break }
        visited.insert(current)

        for (neighbor, weight) in graph[current] ?? [:] {
            let alt = dist[current]! + weight
            if alt < dist[neighbor] ?? Int.max {
                dist[neighbor] = alt
            }
        }
    }
    return dist
}

let graph = [
    "A": ["B": 4, "C": 1],
    "B": ["A": 4, "C": 2, "D": 5],
    "C": ["A": 1, "B": 2, "D": 8],
    "D": ["B": 5, "C": 8],
]

for (node, d) in dijkstra(graph, source: "A").sorted(by: { $0.key < $1.key }) {
    print("\(node): \(d)")
}
