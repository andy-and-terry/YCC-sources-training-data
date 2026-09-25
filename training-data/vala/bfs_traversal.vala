void bfs(string start, Gee.HashMap<string, string[]> graph) {
    var visited = new Gee.ArrayList<string>();
    var queue = new Gee.ArrayList<string>();
    queue.add(start);
    visited.add(start);

    while (queue.size > 0) {
        string node = queue[0];
        queue.remove_at(0);
        stdout.printf("%s ", node);

        if (graph.has_key(node)) {
            foreach (string neighbor in graph[node]) {
                if (!visited.contains(neighbor)) {
                    visited.add(neighbor);
                    queue.add(neighbor);
                }
            }
        }
    }
    stdout.printf("\n");
}

void main() {
    var graph = new Gee.HashMap<string, string[]>();
    graph["a"] = { "b", "c" };
    graph["b"] = { "d" };
    graph["c"] = { "d" };
    graph["d"] = { "e" };
    graph["e"] = {};

    bfs("a", graph);
}
