def knapsack(weights, values, capacity) {
    def dp = new int[capacity + 1]
    for (int i = 0; i < weights.size(); i++) {
        for (int cap = capacity; cap >= weights[i]; cap--) {
            dp[cap] = Math.max(dp[cap], dp[cap - weights[i]] + values[i])
        }
    }
    return dp[capacity]
}

println knapsack([2, 3, 4, 5], [3, 4, 5, 6], 5)
