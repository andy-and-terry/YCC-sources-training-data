struct Edge {
    public int to;
    public int weight;
}

int a_star(Edge[][] graph, int[] heuristic, int source, int target) {
    int n = graph.length;
    int[] g_score = new int[n];
    bool[] visited = new bool[n];
    for (int i = 0; i < n; i++) {
        g_score[i] = int.MAX / 2;
    }
    g_score[source] = 0;

    for (int iter = 0; iter < n; iter++) {
        int best = -1;
        int best_f = int.MAX;
        for (int i = 0; i < n; i++) {
            if (!visited[i] && g_score[i] + heuristic[i] < best_f) {
                best_f = g_score[i] + heuristic[i];
                best = i;
            }
        }
        if (best == -1) {
            break;
        }
        if (best == target) {
            return g_score[best];
        }
        visited[best] = true;

        foreach (Edge e in graph[best]) {
            int tentative = g_score[best] + e.weight;
            if (tentative < g_score[e.to]) {
                g_score[e.to] = tentative;
            }
        }
    }
    return g_score[target];
}

void main() {
    Edge[][] graph = new Edge[4][];
    graph[0] = { Edge() { to = 1, weight = 1 }, Edge() { to = 2, weight = 4 } };
    graph[1] = { Edge() { to = 2, weight = 2 }, Edge() { to = 3, weight = 5 } };
    graph[2] = { Edge() { to = 3, weight = 1 } };
    graph[3] = {};

    int[] heuristic = { 5, 3, 2, 0 };

    stdout.printf("%d\n", a_star(graph, heuristic, 0, 3));
}
