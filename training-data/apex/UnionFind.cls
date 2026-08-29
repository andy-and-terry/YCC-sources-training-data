public class UnionFind {
    private List<Integer> parent;

    public UnionFind(Integer n) {
        parent = new List<Integer>();
        for (Integer i = 0; i < n; i++) {
            parent.add(i);
        }
    }

    public Integer find(Integer x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]);
        }
        return parent[x];
    }

    public void union(Integer x, Integer y) {
        Integer rx = find(x);
        Integer ry = find(y);
        if (rx != ry) {
            parent[rx] = ry;
        }
    }

    public static void main() {
        UnionFind uf = new UnionFind(5);
        uf.union(0, 1);
        uf.union(1, 2);
        System.debug(uf.find(0) == uf.find(2));
        System.debug(uf.find(0) == uf.find(3));
    }
}
