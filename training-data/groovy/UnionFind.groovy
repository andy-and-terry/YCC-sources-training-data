class UnionFind {
    int[] parent

    UnionFind(int n) {
        parent = (0..<n) as int[]
    }

    int find(int x) {
        if (parent[x] == x) return x
        return find(parent[x])
    }

    void union(int x, int y) {
        int rootX = find(x)
        int rootY = find(y)
        if (rootX != rootY) parent[rootX] = rootY
    }
}

def uf = new UnionFind(5)
uf.union(0, 1)
uf.union(1, 2)
println uf.find(0) == uf.find(2)
println uf.find(0) == uf.find(3)
