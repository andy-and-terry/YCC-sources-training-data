import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class KruskalMst {
    static class UnionFind {
        int[] parent;

        UnionFind(int size) {
            parent = new int[size];
            for (int i = 0; i < size; i++) parent[i] = i;
        }

        int find(int x) {
            while (parent[x] != x) x = parent[x];
            return x;
        }

        boolean union(int a, int b) {
            int rootA = find(a);
            int rootB = find(b);
            if (rootA == rootB) return false;
            parent[rootA] = rootB;
            return true;
        }
    }

    public static List<int[]> kruskal(int numNodes, int[][] edges) {
        int[][] sorted = edges.clone();
        Arrays.sort(sorted, (a, b) -> a[2] - b[2]);
        UnionFind uf = new UnionFind(numNodes);
        List<int[]> mst = new ArrayList<>();
        for (int[] edge : sorted) {
            if (uf.union(edge[0], edge[1])) mst.add(edge);
        }
        return mst;
    }

    public static void main(String[] args) {
        int[][] edges = {{0, 1, 1}, {0, 2, 3}, {1, 2, 4}, {1, 3, 2}, {2, 3, 5}};
        for (int[] edge : kruskal(4, edges)) {
            System.out.println(Arrays.toString(edge));
        }
    }
}
