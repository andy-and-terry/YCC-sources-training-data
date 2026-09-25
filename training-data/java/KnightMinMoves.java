import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Deque;

public class KnightMinMoves {
    private static final int[][] MOVES = {{1, 2}, {2, 1}, {2, -1}, {1, -2}, {-1, -2}, {-2, -1}, {-2, 1}, {-1, 2}};

    /** Distance from (sx, sy) to every square of an n x n board. */
    public static int[][] distances(int n, int sx, int sy) {
        int[][] dist = new int[n][n];
        for (int[] row : dist) Arrays.fill(row, -1);
        dist[sx][sy] = 0;
        Deque<int[]> q = new ArrayDeque<>();
        q.add(new int[] {sx, sy});
        while (!q.isEmpty()) {
            int[] p = q.poll();
            for (int[] m : MOVES) {
                int x = p[0] + m[0], y = p[1] + m[1];
                if (x >= 0 && x < n && y >= 0 && y < n && dist[x][y] < 0) {
                    dist[x][y] = dist[p[0]][p[1]] + 1;
                    q.add(new int[] {x, y});
                }
            }
        }
        return dist;
    }

    public static void main(String[] args) {
        int[][] d = distances(8, 0, 0);
        for (int y = 7; y >= 0; y--) {
            StringBuilder sb = new StringBuilder();
            for (int x = 0; x < 8; x++) sb.append(d[x][y]).append(' ');
            System.out.println(sb.toString().trim());
        }
    }
}
