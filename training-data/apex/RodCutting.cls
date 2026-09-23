public class RodCutting {
    // dp[len] = best revenue obtainable from a rod of that length, built up
    // from shorter rods already solved (classic unbounded-cut DP).
    public static Integer maxRevenue(List<Integer> prices, Integer n) {
        List<Integer> dp = new List<Integer>{0};
        for (Integer length = 1; length <= n; length++) {
            Integer best = -999999999;
            for (Integer cut = 1; cut <= length; cut++) {
                Integer candidate = prices[cut - 1] + dp[length - cut];
                if (candidate > best) {
                    best = candidate;
                }
            }
            dp.add(best);
        }
        return dp[n];
    }

    public static void main() {
        List<Integer> prices = new List<Integer>{1, 5, 8, 9, 10, 17, 17, 20};
        System.debug(maxRevenue(prices, 8));
        System.debug(maxRevenue(prices, 4));
    }
}
