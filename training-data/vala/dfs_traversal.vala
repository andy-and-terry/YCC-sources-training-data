void dfs(string node, Gee.HashMap<string, string[]> graph, Gee.ArrayList<string> visited) {
    if (visited.contains(node)) return;
    visited.add(node);
    stdout.printf("%s ", node);

    if (graph.has_key(node)) {
        foreach (string neighbor in graph[node]) {
            dfs(neighbor, graph, visited);
        }
    }
}

void main() {
    var graph = new Gee.HashMap<string, string[]>();
    graph["a"] = { "b", "c" };
    graph["b"] = { "d" };
    graph["c"] = { "d" };
    graph["d"] = { "e" };
    graph["e"] = {};

    var visited = new Gee.ArrayList<string>();
    dfs("a", graph, visited);
    stdout.printf("\n");
}
