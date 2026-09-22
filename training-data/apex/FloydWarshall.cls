public class FloydWarshall {
    private static final Integer INF = 999999;

    public static List<List<Integer>> allPairsShortestPaths(List<List<Integer>> graph) {
        Integer n = graph.size();
        List<List<Integer>> dist = new List<List<Integer>>();
        for (Integer i = 0; i < n; i++) {
            dist.add(graph[i].clone());
        }

        for (Integer k = 0; k < n; k++) {
            for (Integer i = 0; i < n; i++) {
                for (Integer j = 0; j < n; j++) {
                    if (dist[i][k] + dist[k][j] < dist[i][j]) {
                        dist[i][j] = dist[i][k] + dist[k][j];
                    }
                }
            }
        }
        return dist;
    }

    public static void main() {
        List<List<Integer>> graph = new List<List<Integer>>{
            new List<Integer>{0, 5, INF, 10},
            new List<Integer>{INF, 0, 3, INF},
            new List<Integer>{INF, INF, 0, 1},
            new List<Integer>{INF, INF, INF, 0}
        };
        System.debug(allPairsShortestPaths(graph));
    }
}
