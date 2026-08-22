func topologicalSort(_ graph: [Int: [Int]], nodeCount: Int) -> [Int] {
    var inDegree = [Int](repeating: 0, count: nodeCount)
    for (_, neighbors) in graph {
        for n in neighbors { inDegree[n] += 1 }
    }
    var queue = (0..<nodeCount).filter { inDegree[$0] == 0 }
    var result: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst()
        result.append(node)
        for neighbor in graph[node] ?? [] {
            inDegree[neighbor] -= 1
            if inDegree[neighbor] == 0 {
                queue.append(neighbor)
            }
        }
    }
    return result
}

let graph = [0: [1, 2], 1: [3], 2: [3], 3: []]
print(topologicalSort(graph, nodeCount: 4))
