#include <iostream>
#include <vector>
#include <algorithm>

int rodCutting(const std::vector<int>& price, int n) {
    std::vector<int> dp(n + 1, 0);

    for (int len = 1; len <= n; len++) {
        int best = 0;
        for (int cut = 1; cut <= len; cut++) {
            best = std::max(best, price[cut - 1] + dp[len - cut]);
        }
        dp[len] = best;
    }
    return dp[n];
}

int main() {
    std::vector<int> price = {1, 5, 8, 9, 10, 17, 17, 20};
    std::cout << rodCutting(price, static_cast<int>(price.size())) << std::endl;
    std::cout << rodCutting(price, 4) << std::endl;
    return 0;
}
