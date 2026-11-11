public class TriangleMinPath {
    public static Integer minimumTotal(List<List<Integer>> t) {
        List<Integer> dp = t[t.size() - 1].clone();
        for (Integer r = t.size() - 2; r >= 0; r--) {
            for (Integer i = 0; i < t[r].size(); i++) {
                dp[i] = t[r][i] + Math.min(dp[i], dp[i + 1]);
            }
        }
        return dp[0];
    }

    public static void demo() {
        List<List<Integer>> t = new List<List<Integer>>{
            new List<Integer>{2}, new List<Integer>{3, 4},
            new List<Integer>{6, 5, 7}, new List<Integer>{4, 1, 8, 3}
        };
        System.debug(minimumTotal(t)); // 11
    }
}
