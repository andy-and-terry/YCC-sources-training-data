#include <algorithm>
#include <climits>
#include <iostream>
#include <vector>

int matrixChainOrder(const std::vector<int>& dims) {
    int n = static_cast<int>(dims.size()) - 1;
    std::vector<std::vector<int>> dp(n, std::vector<int>(n, 0));

    for (int len = 2; len <= n; len++) {
        for (int i = 0; i + len - 1 < n; i++) {
            int j = i + len - 1;
            dp[i][j] = INT_MAX;
            for (int k = i; k < j; k++) {
                int cost = dp[i][k] + dp[k + 1][j] + dims[i] * dims[k + 1] * dims[j + 1];
                dp[i][j] = std::min(dp[i][j], cost);
            }
        }
    }
    return dp[0][n - 1];
}

int main() {
    std::vector<int> dims = {40, 20, 30, 10, 30};
    std::cout << matrixChainOrder(dims) << std::endl;
    return 0;
}
