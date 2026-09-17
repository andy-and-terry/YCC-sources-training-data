public class RodCutting {
    public static int rodCutting(int[] prices, int length) {
        int[] dp = new int[length + 1];
        for (int l = 1; l <= length; l++) {
            int best = 0;
            for (int cut = 1; cut <= l && cut <= prices.length; cut++) {
                best = Math.max(best, prices[cut - 1] + dp[l - cut]);
            }
            dp[l] = best;
        }
        return dp[length];
    }

    public static void main(String[] args) {
        int[] prices = {1, 5, 8, 9, 10, 17, 17, 20};
        System.out.println(rodCutting(prices, 8));
    }
}
