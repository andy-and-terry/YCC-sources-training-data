struct Edge {
    let from: Int
    let to: Int
    let weight: Int
}

func bellmanFord(_ n: Int, _ edges: [Edge], source: Int) -> [Int]? {
    let inf = Int.max / 2
    var dist = [Int](repeating: inf, count: n)
    dist[source] = 0

    for _ in 0..<(n - 1) {
        for edge in edges where dist[edge.from] + edge.weight < dist[edge.to] {
            dist[edge.to] = dist[edge.from] + edge.weight
        }
    }

    for edge in edges where dist[edge.from] + edge.weight < dist[edge.to] {
        return nil // negative-weight cycle detected
    }
    return dist
}

let edges = [
    Edge(from: 0, to: 1, weight: 4),
    Edge(from: 0, to: 2, weight: 5),
    Edge(from: 1, to: 2, weight: -3),
    Edge(from: 2, to: 3, weight: 4),
    Edge(from: 3, to: 1, weight: -1),
]

if let dist = bellmanFord(4, edges, source: 0) {
    print(dist)
} else {
    print("negative-weight cycle detected")
}
