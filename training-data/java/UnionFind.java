public class UnionFind {
    private final int[] parent;
    private final int[] rank;

    public UnionFind(int size) {
        parent = new int[size];
        rank = new int[size];
        for (int i = 0; i < size; i++) parent[i] = i;
    }

    public int find(int x) {
        if (parent[x] != x) parent[x] = find(parent[x]);
        return parent[x];
    }

    public boolean union(int a, int b) {
        int rootA = find(a);
        int rootB = find(b);
        if (rootA == rootB) return false;
        if (rank[rootA] < rank[rootB]) {
            int tmp = rootA;
            rootA = rootB;
            rootB = tmp;
        }
        parent[rootB] = rootA;
        if (rank[rootA] == rank[rootB]) rank[rootA]++;
        return true;
    }

    public static void main(String[] args) {
        UnionFind uf = new UnionFind(5);
        uf.union(0, 1);
        uf.union(1, 2);
        System.out.println((uf.find(0) == uf.find(2)) + " " + (uf.find(0) == uf.find(3)));
    }
}
