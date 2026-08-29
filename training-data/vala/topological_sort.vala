void visit_node(string node, Gee.HashMap<string, string[]> graph, Gee.ArrayList<string> visited, Gee.ArrayList<string> order) {
    if (visited.contains(node)) return;
    visited.add(node);
    if (graph.has_key(node)) {
        foreach (string dep in graph[node]) {
            visit_node(dep, graph, visited, order);
        }
    }
    order.add(node);
}

void main() {
    var graph = new Gee.HashMap<string, string[]>();
    graph["a"] = { "b", "c" };
    graph["b"] = { "d" };
    graph["c"] = { "d" };
    graph["d"] = {};

    var visited = new Gee.ArrayList<string>();
    var order = new Gee.ArrayList<string>();
    foreach (var key in graph.keys) {
        visit_node(key, graph, visited, order);
    }
    foreach (string node in order) {
        stdout.printf("%s ", node);
    }
    stdout.printf("\n");
}
