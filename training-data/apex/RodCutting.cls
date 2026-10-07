public class RodCutting {
    public static Integer maxRevenue(List<Integer> prices, Integer length) {
        List<Integer> dp = new List<Integer>();
        for (Integer i = 0; i <= length; i++) {
            dp.add(0);
        }
        for (Integer i = 1; i <= length; i++) {
            Integer best = -1;
            for (Integer cut = 1; cut <= i; cut++) {
                best = Math.max(best, prices[cut - 1] + dp[i - cut]);
            }
            dp[i] = best;
        }
        return dp[length];
    }

    public static void main() {
        List<Integer> prices = new List<Integer>{1, 5, 8, 9, 10, 17, 17, 20};
        System.debug(maxRevenue(prices, 8));
    }
}
