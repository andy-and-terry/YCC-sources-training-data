import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MinPathSum {
    record Answer(int cost, List<String> path) {}

    public static Answer solve(int[][] g) {
        int rows = g.length, cols = g[0].length;
        int[][] dp = new int[rows][cols];
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                int best = (r == 0 && c == 0) ? 0 : Integer.MAX_VALUE;
                if (r > 0) best = Math.min(best, dp[r - 1][c]);
                if (c > 0) best = Math.min(best, dp[r][c - 1]);
                dp[r][c] = best + g[r][c];
            }
        }
        List<String> path = new ArrayList<>();
        int r = rows - 1, c = cols - 1;
        while (r > 0 || c > 0) {
            path.add("(" + r + "," + c + ")");
            if (r == 0 || (c > 0 && dp[r][c - 1] < dp[r - 1][c])) c--;
            else r--;
        }
        path.add("(0,0)");
        Collections.reverse(path);
        return new Answer(dp[rows - 1][cols - 1], path);
    }

    public static void main(String[] args) {
        System.out.println(solve(new int[][] {{1, 3, 1}, {1, 5, 1}, {4, 2, 1}}));
    }
}
