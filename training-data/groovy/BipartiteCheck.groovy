boolean isBipartite(Map<Integer, List<Integer>> graph, int numNodes) {
    def color = [:]
    for (int start = 0; start < numNodes; start++) {
        if (color.containsKey(start)) continue
        color[start] = 0
        def queue = [start] as LinkedList
        while (!queue.isEmpty()) {
            def node = queue.poll()
            for (neighbor in (graph[node] ?: [])) {
                if (!color.containsKey(neighbor)) {
                    color[neighbor] = 1 - color[node]
                    queue.add(neighbor)
                } else if (color[neighbor] == color[node]) {
                    return false
                }
            }
        }
    }
    return true
}

def evenCycle = [0: [1, 3], 1: [0, 2], 2: [1, 3], 3: [0, 2]]
println isBipartite(evenCycle, 4)

def oddCycle = [0: [1, 2], 1: [0, 2], 2: [0, 1]]
println isBipartite(oddCycle, 3)
