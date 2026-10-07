public class LongestPalindromicSubsequence {
    public static String lps(String s) {
        int n = s.length();
        if (n == 0) return "";
        int[][] dp = new int[n][n];
        for (int i = n - 1; i >= 0; i--) {
            dp[i][i] = 1;
            for (int j = i + 1; j < n; j++) {
                dp[i][j] = s.charAt(i) == s.charAt(j) ? dp[i + 1][j - 1] + 2 : Math.max(dp[i + 1][j], dp[i][j - 1]);
            }
        }
        StringBuilder left = new StringBuilder(), right = new StringBuilder();
        int i = 0, j = n - 1;
        while (i <= j) {
            if (i == j) {
                left.append(s.charAt(i));
                break;
            }
            if (s.charAt(i) == s.charAt(j)) {
                left.append(s.charAt(i++));
                right.append(s.charAt(j--));
            } else if (dp[i + 1][j] >= dp[i][j - 1]) {
                i++;
            } else {
                j--;
            }
        }
        return left.toString() + right.reverse();
    }

    public static void main(String[] args) {
        for (String s : new String[] {"bbbab", "character", "agbdba"}) System.out.println(s + " -> " + lps(s));
    }
}
