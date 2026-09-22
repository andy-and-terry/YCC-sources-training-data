public class LongestCommonSubsequence {
    public static Integer lcsLength(String a, String b) {
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

        for (Integer i = 1; i <= m; i++) {
            for (Integer j = 1; j <= n; j++) {
                if (a.charAt(i - 1) == b.charAt(j - 1)) {
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                } else {
                    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
                }
            }
        }
        return dp[m][n];
    }

    public static void main() {
        System.debug(lcsLength('abcde', 'ace'));
        System.debug(lcsLength('abc', 'abc'));
    }
}
