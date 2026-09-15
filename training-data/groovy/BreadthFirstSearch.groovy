class BreadthFirstSearch {
    static List traverse(Map<Integer, List<Integer>> graph, int start) {
        def visited = [start] as Set
        def queue = [start] as LinkedList
        def order = []
        while (!queue.isEmpty()) {
            def node = queue.poll()
            order << node
            for (neighbor in graph.getOrDefault(node, [])) {
                if (!visited.contains(neighbor)) {
                    visited << neighbor
                    queue << neighbor
                }
            }
        }
        return order
    }
}

def graph = [
    0: [1, 2],
    1: [0, 3],
    2: [0, 3],
    3: [1, 2, 4],
    4: [3]
]
println BreadthFirstSearch.traverse(graph, 0)
