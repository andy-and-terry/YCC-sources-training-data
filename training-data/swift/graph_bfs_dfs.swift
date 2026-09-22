func bfs(_ graph: [Int: [Int]], from start: Int) -> [Int] {
    var visited: Set<Int> = [start]
    var queue = [start]
    var order: [Int] = []

    while !queue.isEmpty {
        let node = queue.removeFirst()
        order.append(node)
        for neighbor in graph[node] ?? [] where !visited.contains(neighbor) {
            visited.insert(neighbor)
            queue.append(neighbor)
        }
    }
    return order
}

func dfs(_ graph: [Int: [Int]], from start: Int) -> [Int] {
    var visited: Set<Int> = []
    var order: [Int] = []

    func visit(_ node: Int) {
        guard !visited.contains(node) else { return }
        visited.insert(node)
        order.append(node)
        for neighbor in graph[node] ?? [] {
            visit(neighbor)
        }
    }

    visit(start)
    return order
}

let graph = [
    1: [2, 3],
    2: [4],
    3: [4],
    4: [5],
    5: [],
]

print(bfs(graph, from: 1))
print(dfs(graph, from: 1))
