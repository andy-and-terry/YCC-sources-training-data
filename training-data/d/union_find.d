import std.stdio;

class UnionFind {
    int[] parent;
    int[] rank;

    this(int n) {
        parent = new int[](n);
        rank = new int[](n);
        foreach (i; 0 .. n) parent[i] = i;
    }

    int find(int x) {
        if (parent[x] != x) parent[x] = find(parent[x]);
        return parent[x];
    }

    void unite(int a, int b) {
        int rootA = find(a), rootB = find(b);
        if (rootA == rootB) return;
        if (rank[rootA] < rank[rootB]) parent[rootA] = rootB;
        else if (rank[rootA] > rank[rootB]) parent[rootB] = rootA;
        else { parent[rootB] = rootA; rank[rootA]++; }
    }

    bool connected(int a, int b) {
        return find(a) == find(b);
    }
}

void main() {
    auto uf = new UnionFind(6);
    uf.unite(0, 1);
    uf.unite(1, 2);
    writeln(uf.connected(0, 2));
    writeln(uf.connected(0, 5));
}
