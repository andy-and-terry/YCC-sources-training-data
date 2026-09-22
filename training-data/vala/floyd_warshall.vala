struct Edge {
    public int from;
    public int to;
    public int weight;
}

int[,] floyd_warshall(int n, Edge[] edges) {
    int[,] dist = new int[n, n];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            dist[i, j] = (i == j) ? 0 : 999999;
        }
    }
    foreach (Edge e in edges) {
        dist[e.from, e.to] = e.weight;
    }

    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (dist[i, k] + dist[k, j] < dist[i, j]) {
                    dist[i, j] = dist[i, k] + dist[k, j];
                }
            }
        }
    }
    return dist;
}

void main() {
    Edge[] edges = {
        { 0, 1, 3 },
        { 0, 2, 8 },
        { 1, 2, 2 },
        { 2, 3, 1 },
        { 3, 0, 4 },
    };

    int[,] dist = floyd_warshall(4, edges);
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            stdout.printf("%d ", dist[i, j]);
        }
        stdout.printf("\n");
    }
}
