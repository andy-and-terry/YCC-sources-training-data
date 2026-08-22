import java.util.Arrays;

public class CoinChange {
    public static int coinChange(int[] coins, int amount) {
        int[] dp = new int[amount + 1];
        Arrays.fill(dp, Integer.MAX_VALUE / 2);
        dp[0] = 0;
        for (int a = 1; a <= amount; a++) {
            for (int coin : coins) {
                if (coin <= a) dp[a] = Math.min(dp[a], dp[a - coin] + 1);
            }
        }
        return dp[amount] >= Integer.MAX_VALUE / 2 ? -1 : dp[amount];
    }

    public static void main(String[] args) {
        System.out.println(coinChange(new int[] {1, 2, 5}, 11));
    }
}
