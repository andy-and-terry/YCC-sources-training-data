public class Knapsack01 {
    public static Integer knapsack(List<Integer> weights, List<Integer> values, Integer capacity) {
        Integer n = weights.size();
        List<List<Integer>> dp = new List<List<Integer>>();
        for (Integer i = 0; i <= n; i++) {
            List<Integer> row = new List<Integer>();
            for (Integer w = 0; w <= capacity; w++) {
                row.add(0);
            }
            dp.add(row);
        }
        for (Integer i = 1; i <= n; i++) {
            for (Integer w = 0; w <= capacity; w++) {
                if (weights[i - 1] <= w) {
                    dp[i][w] = Math.max(dp[i - 1][w], values[i - 1] + dp[i - 1][w - weights[i - 1]]);
                } else {
                    dp[i][w] = dp[i - 1][w];
                }
            }
        }
        return dp[n][capacity];
    }

    public static void main() {
        List<Integer> weights = new List<Integer>{2, 3, 4, 5};
        List<Integer> values = new List<Integer>{3, 4, 5, 6};
        System.debug(knapsack(weights, values, 5));
    }
}
