#include <iostream>
#include <vector>

bool hasSubsetSum(const std::vector<int>& nums, int target) {
    size_t n = nums.size();
    std::vector<std::vector<bool>> dp(n + 1, std::vector<bool>(target + 1, false));
    for (size_t i = 0; i <= n; i++) dp[i][0] = true;
    for (size_t i = 1; i <= n; i++) {
        for (int t = 1; t <= target; t++) {
            dp[i][t] = dp[i - 1][t];
            if (nums[i - 1] <= t) dp[i][t] = dp[i][t] || dp[i - 1][t - nums[i - 1]];
        }
    }
    return dp[n][target];
}

int main() {
    std::cout << hasSubsetSum({3, 34, 4, 12, 5, 2}, 9) << std::endl;
    return 0;
}
