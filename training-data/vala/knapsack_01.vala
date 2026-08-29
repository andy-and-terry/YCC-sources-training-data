int knapsack(int[] weights, int[] values, int capacity) {
    int[] dp = new int[capacity + 1];
    for (int i = 0; i < weights.length; i++) {
        for (int cap = capacity; cap >= weights[i]; cap--) {
            dp[cap] = int.max(dp[cap], dp[cap - weights[i]] + values[i]);
        }
    }
    return dp[capacity];
}

void main() {
    int[] weights = { 2, 3, 4, 5 };
    int[] values = { 3, 4, 5, 6 };
    stdout.printf("%d\n", knapsack(weights, values, 5));
}
