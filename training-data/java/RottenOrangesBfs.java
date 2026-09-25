import java.util.ArrayDeque;
import java.util.Deque;

public class RottenOrangesBfs {
    public static int minutes(int[][] input) {
        int[][] g = new int[input.length][];
        for (int i = 0; i < input.length; i++) g[i] = input[i].clone();
        Deque<int[]> q = new ArrayDeque<>();
        int fresh = 0;
        for (int r = 0; r < g.length; r++)
            for (int c = 0; c < g[r].length; c++) {
                if (g[r][c] == 2) q.add(new int[] {r, c});
                else if (g[r][c] == 1) fresh++;
            }
        int minutes = 0;
        int[][] dirs = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        while (!q.isEmpty() && fresh > 0) {
            for (int size = q.size(); size > 0; size--) {
                int[] p = q.poll();
                for (int[] d : dirs) {
                    int r = p[0] + d[0], c = p[1] + d[1];
                    if (r >= 0 && r < g.length && c >= 0 && c < g[r].length && g[r][c] == 1) {
                        g[r][c] = 2;
                        fresh--;
                        q.add(new int[] {r, c});
                    }
                }
            }
            minutes++;
        }
        return fresh == 0 ? minutes : -1;
    }

    public static void main(String[] args) {
        System.out.println(minutes(new int[][] {{2, 1, 1}, {1, 1, 0}, {0, 1, 1}}) + " " + minutes(new int[][] {{2, 1, 1}, {0, 1, 1}, {1, 0, 1}}));
    }
}
