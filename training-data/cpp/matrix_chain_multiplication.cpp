#include <climits>
#include <iostream>
#include <vector>

// dims has n+1 entries: matrix i has dimensions dims[i-1] x dims[i].
long long matrixChainOrder(const std::vector<int>& dims) {
    int n = static_cast<int>(dims.size()) - 1;
    std::vector<std::vector<long long>> dp(n + 1, std::vector<long long>(n + 1, 0));

    for (int len = 2; len <= n; len++) {
        for (int i = 1; i <= n - len + 1; i++) {
            int j = i + len - 1;
            dp[i][j] = LLONG_MAX;
            for (int k = i; k < j; k++) {
                long long cost = dp[i][k] + dp[k + 1][j] +
                                  static_cast<long long>(dims[i - 1]) * dims[k] * dims[j];
                dp[i][j] = std::min(dp[i][j], cost);
            }
        }
    }
    return dp[1][n];
}

int main() {
    // Matrices: 40x20, 20x30, 30x10, 10x30 -> dims = {40, 20, 30, 10, 30}
    std::vector<int> dims = {40, 20, 30, 10, 30};
    std::cout << "minimum multiplication cost: " << matrixChainOrder(dims) << std::endl;
    return 0;
}
