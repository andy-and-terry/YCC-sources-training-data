class Edge : Object {
    public int from;
    public int to;
    public int weight;

    public Edge(int f, int t, int w) {
        from = f;
        to = t;
        weight = w;
    }
}

class DisjointSet : Object {
    int[] parent;

    public DisjointSet(int n) {
        parent = new int[n];
        for (int i = 0; i < n; i++) parent[i] = i;
    }

    public int find(int x) {
        if (parent[x] == x) return x;
        parent[x] = find(parent[x]);
        return parent[x];
    }

    public bool union(int x, int y) {
        int root_x = find(x);
        int root_y = find(y);
        if (root_x == root_y) return false;
        parent[root_x] = root_y;
        return true;
    }
}

Edge[] kruskal_mst(int num_nodes, Edge[] edges) {
    Edge[] sorted = edges;
    for (int i = 0; i < sorted.length; i++) {
        for (int j = 0; j < sorted.length - i - 1; j++) {
            if (sorted[j].weight > sorted[j + 1].weight) {
                Edge temp = sorted[j];
                sorted[j] = sorted[j + 1];
                sorted[j + 1] = temp;
            }
        }
    }

    var dsu = new DisjointSet(num_nodes);
    Edge[] mst = {};
    foreach (var e in sorted) {
        if (dsu.union(e.from, e.to)) {
            mst += e;
        }
    }
    return mst;
}

void main() {
    Edge[] edges = {
        new Edge(0, 1, 4),
        new Edge(0, 2, 1),
        new Edge(2, 1, 2),
        new Edge(1, 3, 5),
        new Edge(2, 3, 8),
        new Edge(3, 4, 3)
    };

    var mst = kruskal_mst(5, edges);
    int total = 0;
    foreach (var e in mst) {
        stdout.printf("%d-%d (%d) ", e.from, e.to, e.weight);
        total += e.weight;
    }
    stdout.printf("\ntotal weight: %d\n", total);
}
