public class PrimsMST {
    public Integer minimumSpanningTree(Integer n, List<List<Integer>> adjacencyMatrix) {
        List<Boolean> inMst = new List<Boolean>();
        List<Integer> minEdge = new List<Integer>();
        for (Integer i = 0; i < n; i++) {
            inMst.add(false);
            minEdge.add(2147483647);
        }
        minEdge[0] = 0;

        Integer totalWeight = 0;
        for (Integer count = 0; count < n; count++) {
            Integer u = -1;
            for (Integer v = 0; v < n; v++) {
                if (!inMst[v] && (u == -1 || minEdge[v] < minEdge[u])) {
                    u = v;
                }
            }

            inMst[u] = true;
            totalWeight += minEdge[u];

            for (Integer v = 0; v < n; v++) {
                Integer weight = adjacencyMatrix[u][v];
                if (weight > 0 && !inMst[v] && weight < minEdge[v]) {
                    minEdge[v] = weight;
                }
            }
        }
        return totalWeight;
    }

    public static void main() {
        List<List<Integer>> graph = new List<List<Integer>>{
            new List<Integer>{0, 2, 0, 6, 0},
            new List<Integer>{2, 0, 3, 8, 5},
            new List<Integer>{0, 3, 0, 0, 7},
            new List<Integer>{6, 8, 0, 0, 9},
            new List<Integer>{0, 5, 7, 9, 0}
        };
        PrimsMST prim = new PrimsMST();
        System.debug(prim.minimumSpanningTree(5, graph));
    }
}
