void main() {
    int n = 5;
    int[,] graph = {
        { 0, 2, 0, 6, 0 },
        { 2, 0, 3, 8, 5 },
        { 0, 3, 0, 0, 7 },
        { 6, 8, 0, 0, 9 },
        { 0, 5, 7, 9, 0 },
    };

    bool[] in_mst = new bool[n];
    int[] key = new int[n];
    int[] parent = new int[n];

    for (int i = 0; i < n; i++) {
        key[i] = int.MAX;
        in_mst[i] = false;
        parent[i] = -1;
    }
    key[0] = 0;

    for (int count = 0; count < n - 1; count++) {
        int u = -1;
        int min = int.MAX;
        for (int v = 0; v < n; v++) {
            if (!in_mst[v] && key[v] < min) {
                min = key[v];
                u = v;
            }
        }
        in_mst[u] = true;

        for (int v = 0; v < n; v++) {
            int weight = graph[u, v];
            if (weight != 0 && !in_mst[v] && weight < key[v]) {
                key[v] = weight;
                parent[v] = u;
            }
        }
    }

    int total = 0;
    for (int i = 1; i < n; i++) {
        stdout.printf("%d-%d: %d\n", parent[i], i, graph[i, parent[i]]);
        total += graph[i, parent[i]];
    }
    stdout.printf("total weight: %d\n", total);
}
