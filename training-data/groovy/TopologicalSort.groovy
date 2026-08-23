def visit(node, graph, visited, order) {
    if (visited.contains(node)) return
    visited << node
    (graph[node] ?: []).each { dep -> visit(dep, graph, visited, order) }
    order << node
}

def topoSort(graph) {
    def visited = [] as Set
    def order = []
    graph.keySet().each { visit(it, graph, visited, order) }
    return order
}

def graph = ['a': ['b', 'c'], 'b': ['d'], 'c': ['d'], 'd': []]
println topoSort(graph)
