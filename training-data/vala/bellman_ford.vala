struct Edge {
    public int from;
    public int to;
    public int weight;
}

int[]? bellman_ford(int n, Edge[] edges, int source) {
    int[] dist = new int[n];
    for (int i = 0; i < n; i++) dist[i] = 999999;
    dist[source] = 0;

    for (int iter = 0; iter < n - 1; iter++) {
        foreach (Edge e in edges) {
            if (dist[e.from] + e.weight < dist[e.to]) {
                dist[e.to] = dist[e.from] + e.weight;
            }
        }
    }

    foreach (Edge e in edges) {
        if (dist[e.from] + e.weight < dist[e.to]) {
            return null; // negative-weight cycle
        }
    }
    return dist;
}

void main() {
    Edge[] edges = {
        { 0, 1, 4 },
        { 0, 2, 5 },
        { 1, 2, -3 },
        { 2, 3, 4 },
        { 3, 1, -1 },
    };

    int[]? dist = bellman_ford(4, edges, 0);
    if (dist == null) {
        stdout.printf("negative-weight cycle detected\n");
    } else {
        foreach (int d in dist) {
            stdout.printf("%d ", d);
        }
        stdout.printf("\n");
    }
}
