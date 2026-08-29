public class CoinChange {
    public static Integer coinChange(List<Integer> coins, Integer amount) {
        List<Integer> dp = new List<Integer>();
        for (Integer i = 0; i <= amount; i++) {
            dp.add(amount + 1);
        }
        dp[0] = 0;
        for (Integer a = 1; a <= amount; a++) {
            for (Integer coin : coins) {
                if (coin <= a) {
                    dp[a] = Math.min(dp[a], dp[a - coin] + 1);
                }
            }
        }
        return dp[amount] > amount ? -1 : dp[amount];
    }

    public static void main() {
        List<Integer> coins = new List<Integer>{1, 2, 5};
        System.debug(coinChange(coins, 11));
    }
}
