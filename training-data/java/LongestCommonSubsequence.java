public class LongestCommonSubsequence {
    public static String lcs(String a, String b) {
        int m = a.length();
        int n = b.length();
        String[][] dp = new String[m + 1][n + 1];
        for (int i = 0; i <= m; i++) dp[i][0] = "";
        for (int j = 0; j <= n; j++) dp[0][j] = "";
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                if (a.charAt(i - 1) == b.charAt(j - 1)) {
                    dp[i][j] = dp[i - 1][j - 1] + a.charAt(i - 1);
                } else {
                    dp[i][j] = dp[i - 1][j].length() >= dp[i][j - 1].length() ? dp[i - 1][j] : dp[i][j - 1];
                }
            }
        }
        return dp[m][n];
    }

    public static void main(String[] args) {
        System.out.println(lcs("ABCBDAB", "BDCABA"));
    }
}
