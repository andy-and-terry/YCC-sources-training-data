class UnionFind : Object {
    int[] parent;

    public UnionFind(int n) {
        parent = new int[n];
        for (int i = 0; i < n; i++) parent[i] = i;
    }

    public int find(int x) {
        if (parent[x] == x) return x;
        return find(parent[x]);
    }

    public void union(int x, int y) {
        int root_x = find(x);
        int root_y = find(y);
        if (root_x != root_y) parent[root_x] = root_y;
    }
}

void main() {
    var uf = new UnionFind(5);
    uf.union(0, 1);
    uf.union(1, 2);
    stdout.printf("%s\n", (uf.find(0) == uf.find(2)).to_string());
    stdout.printf("%s\n", (uf.find(0) == uf.find(3)).to_string());
}
