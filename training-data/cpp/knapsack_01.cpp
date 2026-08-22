#include <algorithm>
#include <iostream>
#include <vector>

int knapsack(const std::vector<int>& weights, const std::vector<int>& values, int capacity) {
    size_t n = weights.size();
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(capacity + 1, 0));
    for (size_t i = 1; i <= n; i++) {
        for (int w = 0; w <= capacity; w++) {
            dp[i][w] = dp[i - 1][w];
            if (weights[i - 1] <= w) {
                dp[i][w] = std::max(dp[i][w], dp[i - 1][w - weights[i - 1]] + values[i - 1]);
            }
        }
    }
    return dp[n][capacity];
}

int main() {
    std::cout << knapsack({1, 3, 4, 5}, {1, 4, 5, 7}, 7) << std::endl;
    return 0;
}
