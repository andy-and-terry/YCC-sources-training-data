#include <iostream>
#include <string>
#include <vector>

std::string lcs(const std::string& a, const std::string& b) {
    size_t m = a.size(), n = b.size();
    std::vector<std::vector<std::string>> dp(m + 1, std::vector<std::string>(n + 1));
    for (size_t i = 1; i <= m; i++) {
        for (size_t j = 1; j <= n; j++) {
            if (a[i - 1] == b[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + a[i - 1];
            } else {
                dp[i][j] = dp[i - 1][j].size() >= dp[i][j - 1].size() ? dp[i - 1][j] : dp[i][j - 1];
            }
        }
    }
    return dp[m][n];
}

int main() {
    std::cout << lcs("ABCBDAB", "BDCABA") << std::endl;
    return 0;
}
