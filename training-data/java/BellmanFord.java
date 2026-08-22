import java.util.Arrays;

public class BellmanFord {
    public static int[] bellmanFord(int numNodes, int[][] edges, int source) {
        int[] dist = new int[numNodes];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[source] = 0;

        for (int i = 0; i < numNodes - 1; i++) {
            for (int[] edge : edges) {
                if (dist[edge[0]] != Integer.MAX_VALUE && dist[edge[0]] + edge[2] < dist[edge[1]]) {
                    dist[edge[1]] = dist[edge[0]] + edge[2];
                }
            }
        }

        for (int[] edge : edges) {
            if (dist[edge[0]] != Integer.MAX_VALUE && dist[edge[0]] + edge[2] < dist[edge[1]]) {
                throw new IllegalStateException("graph contains a negative-weight cycle");
            }
        }

        return dist;
    }

    public static void main(String[] args) {
        int[][] edges = {{0, 1, 4}, {0, 2, 5}, {1, 2, -3}, {2, 3, 4}};
        System.out.println(Arrays.toString(bellmanFord(4, edges, 0)));
    }
}
