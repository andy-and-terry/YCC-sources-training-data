#include <algorithm>
#include <climits>
#include <iostream>
#include <vector>

int coinChange(const std::vector<int>& coins, int amount) {
    std::vector<int> dp(amount + 1, INT_MAX);
    dp[0] = 0;
    for (int a = 1; a <= amount; a++) {
        for (int coin : coins) {
            if (coin <= a && dp[a - coin] != INT_MAX) dp[a] = std::min(dp[a], dp[a - coin] + 1);
        }
    }
    return dp[amount] == INT_MAX ? -1 : dp[amount];
}

int main() {
    std::cout << coinChange({1, 2, 5}, 11) << std::endl;
    return 0;
}
