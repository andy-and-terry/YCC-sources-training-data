public class TriangleMinPath {
    static int minimumTotal(int[][] t) {
        int[] dp = t[t.length - 1].clone();
        for (int r = t.length - 2; r >= 0; r--)
            for (int i = 0; i < t[r].length; i++)
                dp[i] = t[r][i] + Math.min(dp[i], dp[i + 1]);
        return dp[0];
    }

    public static void main(String[] args) {
        System.out.println(minimumTotal(new int[][] {{2}, {3, 4}, {6, 5, 7}, {4, 1, 8, 3}})); // 11
    }
}
