bool is_bipartite(int[][] graph) {
    int n = graph.length;
    int[] color = new int[n];
    for (int i = 0; i < n; i++) {
        color[i] = -1;
    }

    for (int start = 0; start < n; start++) {
        if (color[start] != -1) {
            continue;
        }
        var queue = new Gee.ArrayQueue<int>();
        color[start] = 0;
        queue.offer(start);

        while (!queue.is_empty) {
            int node = queue.poll();
            foreach (int neighbor in graph[node]) {
                if (color[neighbor] == -1) {
                    color[neighbor] = 1 - color[node];
                    queue.offer(neighbor);
                } else if (color[neighbor] == color[node]) {
                    return false;
                }
            }
        }
    }
    return true;
}

void main() {
    int[][] bipartite_graph = new int[4][];
    bipartite_graph[0] = { 1, 3 };
    bipartite_graph[1] = { 0, 2 };
    bipartite_graph[2] = { 1, 3 };
    bipartite_graph[3] = { 0, 2 };

    int[][] non_bipartite_graph = new int[3][];
    non_bipartite_graph[0] = { 1, 2 };
    non_bipartite_graph[1] = { 0, 2 };
    non_bipartite_graph[2] = { 0, 1 };

    stdout.printf("%s\n", is_bipartite(bipartite_graph).to_string());
    stdout.printf("%s\n", is_bipartite(non_bipartite_graph).to_string());
}
