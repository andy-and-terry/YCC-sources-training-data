public class UniquePathsGrid {
    public static long paths(int[][] grid) {
        int cols = grid[0].length;
        long[] dp = new long[cols];
        dp[0] = grid[0][0] == 0 ? 1 : 0;
        for (int[] row : grid) {
            for (int c = 0; c < cols; c++) {
                if (row[c] == 1) dp[c] = 0;
                else if (c > 0) dp[c] += dp[c - 1];
            }
        }
        return dp[cols - 1];
    }

    public static void main(String[] args) {
        System.out.println(paths(new int[3][7]) + " " + paths(new int[][] {{0, 0, 0}, {0, 1, 0}, {0, 0, 0}}) + " " + paths(new int[17][17]));
    }
}
