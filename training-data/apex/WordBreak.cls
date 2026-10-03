public class WordBreak {
    public static Boolean canSegment(String s, Set<String> dictionary) {
        Integer n = s.length();
        List<Boolean> dp = new List<Boolean>();
        for (Integer i = 0; i <= n; i++) {
            dp.add(false);
        }
        dp[0] = true;

        for (Integer i = 1; i <= n; i++) {
            for (Integer j = 0; j < i; j++) {
                if (dp[j] && dictionary.contains(s.substring(j, i))) {
                    dp[i] = true;
                    break;
                }
            }
        }
        return dp[n];
    }

    public static void main() {
        Set<String> dict = new Set<String>{'leet', 'code'};
        System.debug(canSegment('leetcode', dict));
        System.debug(canSegment('leetcoded', dict));
    }
}
