public class LongestValidParentheses {
    /** dp[i] = length of the longest valid substring ending at i. */
    public static int longest(String s) {
        int[] dp = new int[s.length()];
        int best = 0;
        for (int i = 1; i < s.length(); i++) {
            if (s.charAt(i) != ')') continue;
            if (s.charAt(i - 1) == '(') {
                dp[i] = (i >= 2 ? dp[i - 2] : 0) + 2;
            } else {
                int j = i - dp[i - 1] - 1;
                if (j >= 0 && s.charAt(j) == '(') dp[i] = dp[i - 1] + 2 + (j >= 1 ? dp[j - 1] : 0);
            }
            best = Math.max(best, dp[i]);
        }
        return best;
    }

    public static void main(String[] args) {
        for (String s : new String[] {"(()", ")()())", "", "()(()", "((()))()"}) System.out.println("\"" + s + "\" " + longest(s));
    }
}
