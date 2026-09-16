import std.stdio;
import std.algorithm : sort;

struct Edge {
    int u, v, weight;
}

class KruskalUnionFind {
    int[] parent;

    this(int n) {
        parent = new int[](n);
        foreach (i; 0 .. n) parent[i] = i;
    }

    int find(int x) {
        if (parent[x] != x) parent[x] = find(parent[x]);
        return parent[x];
    }

    bool unite(int a, int b) {
        int rootA = find(a), rootB = find(b);
        if (rootA == rootB) return false;
        parent[rootA] = rootB;
        return true;
    }
}

Edge[] kruskal(int numNodes, Edge[] edges) {
    auto sorted = edges.dup;
    sort!((a, b) => a.weight < b.weight)(sorted);
    auto uf = new KruskalUnionFind(numNodes);
    Edge[] mst;

    foreach (edge; sorted) {
        if (uf.unite(edge.u, edge.v)) mst ~= edge;
    }

    return mst;
}

void main() {
    auto edges = [
        Edge(0, 1, 1),
        Edge(0, 2, 3),
        Edge(1, 2, 4),
        Edge(1, 3, 2),
        Edge(2, 3, 5),
    ];

    foreach (edge; kruskal(4, edges)) {
        writeln(edge.u, "-", edge.v, ":", edge.weight);
    }
}
