func hasCycle(_ graph: [Int: [Int]], nodeCount: Int) -> Bool {
    var state = [Int](repeating: 0, count: nodeCount) // 0 = unvisited, 1 = in progress, 2 = done

    func dfs(_ node: Int) -> Bool {
        state[node] = 1
        for neighbor in graph[node] ?? [] {
            if state[neighbor] == 1 {
                return true
            }
            if state[neighbor] == 0 && dfs(neighbor) {
                return true
            }
        }
        state[node] = 2
        return false
    }

    for node in 0..<nodeCount where state[node] == 0 {
        if dfs(node) {
            return true
        }
    }
    return false
}

let acyclic = [0: [1, 2], 1: [3], 2: [3], 3: []]
let cyclic = [0: [1], 1: [2], 2: [0]]

print(hasCycle(acyclic, nodeCount: 4))
print(hasCycle(cyclic, nodeCount: 3))
