public class BellmanFord {
    private static final Integer INF = 999999;

    // edges: each entry is [from, to, weight]
    public static List<Integer> shortestPaths(List<List<Integer>> edges, Integer numNodes, Integer source) {
        List<Integer> dist = new List<Integer>();
        for (Integer i = 0; i < numNodes; i++) {
            dist.add(INF);
        }
        dist[source] = 0;

        for (Integer iteration = 0; iteration < numNodes - 1; iteration++) {
            for (List<Integer> edge : edges) {
                Integer u = edge[0];
                Integer v = edge[1];
                Integer w = edge[2];
                if (dist[u] != INF && dist[u] + w < dist[v]) {
                    dist[v] = dist[u] + w;
                }
            }
        }
        return dist;
    }

    public static void main() {
        List<List<Integer>> edges = new List<List<Integer>>{
            new List<Integer>{0, 1, 4},
            new List<Integer>{0, 2, 5},
            new List<Integer>{1, 2, -3},
            new List<Integer>{2, 3, 4}
        };
        System.debug(shortestPaths(edges, 4, 0));
    }
}
