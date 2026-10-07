class UnionFind : Object {
    int[] parent;

    public UnionFind(int n) {
        parent = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }
    }

    public int find(int x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]);
        }
        return parent[x];
    }

    public bool union(int a, int b) {
        int root_a = find(a);
        int root_b = find(b);
        if (root_a == root_b) return false;
        parent[root_a] = root_b;
        return true;
    }
}

struct Edge {
    public int u;
    public int v;
    public int weight;
}

void main() {
    Edge[] edges = {
        { 0, 1, 4 },
        { 0, 2, 1 },
        { 1, 2, 2 },
        { 1, 3, 5 },
        { 2, 3, 8 },
        { 3, 4, 3 },
    };

    // Sort edges by weight (simple insertion sort).
    for (int i = 1; i < edges.length; i++) {
        Edge key = edges[i];
        int j = i - 1;
        while (j >= 0 && edges[j].weight > key.weight) {
            edges[j + 1] = edges[j];
            j--;
        }
        edges[j + 1] = key;
    }

    var uf = new UnionFind(5);
    int total_weight = 0;
    foreach (Edge e in edges) {
        if (uf.union(e.u, e.v)) {
            stdout.printf("%d-%d: %d\n", e.u, e.v, e.weight);
            total_weight += e.weight;
        }
    }
    stdout.printf("total weight: %d\n", total_weight);
}
