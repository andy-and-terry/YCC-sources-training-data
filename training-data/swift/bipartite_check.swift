func isBipartite(_ graph: [Int: [Int]], nodeCount: Int) -> Bool {
    var color = [Int](repeating: -1, count: nodeCount)

    for start in 0..<nodeCount where color[start] == -1 {
        color[start] = 0
        var queue = [start]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            for neighbor in graph[node] ?? [] {
                if color[neighbor] == -1 {
                    color[neighbor] = 1 - color[node]
                    queue.append(neighbor)
                } else if color[neighbor] == color[node] {
                    return false
                }
            }
        }
    }
    return true
}

let bipartiteGraph = [0: [1, 3], 1: [0, 2], 2: [1, 3], 3: [0, 2]]
let nonBipartiteGraph = [0: [1, 2], 1: [0, 2], 2: [0, 1]]

print(isBipartite(bipartiteGraph, nodeCount: 4))
print(isBipartite(nonBipartiteGraph, nodeCount: 3))
