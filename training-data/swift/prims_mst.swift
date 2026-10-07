func primMST(_ graph: [String: [String: Int]]) -> [(String, String, Int)] {
    guard let start = graph.keys.sorted().first else { return [] }

    var visited: Set<String> = [start]
    var mst: [(String, String, Int)] = []

    while visited.count < graph.count {
        var bestEdge: (String, String, Int)?

        for u in visited {
            for (v, weight) in graph[u] ?? [:] where !visited.contains(v) {
                if bestEdge == nil || weight < bestEdge!.2 {
                    bestEdge = (u, v, weight)
                }
            }
        }

        guard let edge = bestEdge else { break }
        visited.insert(edge.1)
        mst.append(edge)
    }

    return mst
}

let graph = [
    "A": ["B": 4, "C": 1],
    "B": ["A": 4, "C": 2, "D": 5],
    "C": ["A": 1, "B": 2, "D": 8],
    "D": ["B": 5, "C": 8],
]

let mst = primMST(graph)
for (u, v, w) in mst {
    print("\(u)-\(v): \(w)")
}
print("total weight:", mst.reduce(0) { $0 + $1.2 })
