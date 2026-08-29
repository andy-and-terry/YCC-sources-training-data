public class EditDistance {
    public static Integer editDistance(String a, String b) {
        Integer m = a.length();
        Integer n = b.length();
        List<List<Integer>> dp = new List<List<Integer>>();
        for (Integer i = 0; i <= m; i++) {
            List<Integer> row = new List<Integer>();
            for (Integer j = 0; j <= n; j++) {
                row.add(0);
            }
            dp.add(row);
        }
        for (Integer i = 0; i <= m; i++) dp[i][0] = i;
        for (Integer j = 0; j <= n; j++) dp[0][j] = j;
        for (Integer i = 1; i <= m; i++) {
            for (Integer j = 1; j <= n; j++) {
                if (a.substring(i - 1, i) == b.substring(j - 1, j)) {
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    dp[i][j] = 1 + Math.min(dp[i - 1][j - 1], Math.min(dp[i - 1][j], dp[i][j - 1]));
                }
            }
        }
        return dp[m][n];
    }

    public static void main() {
        System.debug(editDistance('kitten', 'sitting'));
    }
}
