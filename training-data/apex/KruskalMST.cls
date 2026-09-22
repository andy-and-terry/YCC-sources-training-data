public class KruskalMST {
    public class Edge {
        public Integer u;
        public Integer v;
        public Integer weight;
        public Edge(Integer u, Integer v, Integer weight) {
            this.u = u;
            this.v = v;
            this.weight = weight;
        }
    }

    private List<Integer> parent;

    private Integer find(Integer x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]);
        }
        return parent[x];
    }

    private void sortByWeight(List<Edge> edges) {
        Integer n = edges.size();
        for (Integer i = 0; i < n - 1; i++) {
            for (Integer j = 0; j < n - i - 1; j++) {
                if (edges[j].weight > edges[j + 1].weight) {
                    Edge temp = edges[j];
                    edges[j] = edges[j + 1];
                    edges[j + 1] = temp;
                }
            }
        }
    }

    public Integer minimumSpanningTree(Integer n, List<Edge> edges) {
        parent = new List<Integer>();
        for (Integer i = 0; i < n; i++) {
            parent.add(i);
        }

        sortByWeight(edges);

        Integer totalWeight = 0;
        Integer edgesUsed = 0;
        for (Edge e : edges) {
            if (edgesUsed == n - 1) {
                break;
            }
            Integer rootU = find(e.u);
            Integer rootV = find(e.v);
            if (rootU != rootV) {
                parent[rootU] = rootV;
                totalWeight += e.weight;
                edgesUsed++;
            }
        }
        return totalWeight;
    }

    public static void main() {
        List<Edge> edges = new List<Edge>{
            new Edge(0, 1, 2), new Edge(0, 3, 6), new Edge(1, 2, 3),
            new Edge(1, 3, 8), new Edge(1, 4, 5), new Edge(2, 4, 7),
            new Edge(3, 4, 9)
        };
        KruskalMST mst = new KruskalMST();
        System.debug(mst.minimumSpanningTree(5, edges));
    }
}
