import java.util.Arrays;

public class FloydWarshall {
    public static int[][] floydWarshall(int numNodes, int[][] edges) {
        int[][] dist = new int[numNodes][numNodes];
        for (int[] row : dist) Arrays.fill(row, Integer.MAX_VALUE / 2);
        for (int i = 0; i < numNodes; i++) dist[i][i] = 0;
        for (int[] edge : edges) dist[edge[0]][edge[1]] = edge[2];

        for (int k = 0; k < numNodes; k++) {
            for (int i = 0; i < numNodes; i++) {
                for (int j = 0; j < numNodes; j++) {
                    if (dist[i][k] + dist[k][j] < dist[i][j]) {
                        dist[i][j] = dist[i][k] + dist[k][j];
                    }
                }
            }
        }
        return dist;
    }

    public static void main(String[] args) {
        int[][] edges = {{0, 1, 3}, {0, 2, 8}, {1, 2, 2}, {2, 3, 1}, {3, 0, 4}};
        for (int[] row : floydWarshall(4, edges)) {
            System.out.println(Arrays.toString(row));
        }
    }
}
