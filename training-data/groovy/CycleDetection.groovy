def hasCycle(Map<Integer, List<Integer>> graph) {
    def visited = [:]
    def inStack = [:]

    def visit
    visit = { int node ->
        visited[node] = true
        inStack[node] = true
        for (next in graph.getOrDefault(node, [])) {
            if (!visited[next]) {
                if (visit(next)) return true
            } else if (inStack[next]) {
                return true
            }
        }
        inStack[node] = false
        return false
    }

    for (node in graph.keySet()) {
        if (!visited[node]) {
            if (visit(node)) return true
        }
    }
    return false
}

def acyclic = [0: [1], 1: [2], 2: []]
def cyclic = [0: [1], 1: [2], 2: [0]]
println hasCycle(acyclic)
println hasCycle(cyclic)
