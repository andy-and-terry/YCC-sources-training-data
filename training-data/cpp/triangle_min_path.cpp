#include <algorithm>
#include <iostream>
#include <vector>

int minimumTotal(const std::vector<std::vector<int>>& t) {
    std::vector<int> dp = t.back();
    for (int r = static_cast<int>(t.size()) - 2; r >= 0; --r)
        for (std::size_t i = 0; i < t[r].size(); ++i)
            dp[i] = t[r][i] + std::min(dp[i], dp[i + 1]);
    return dp[0];
}

int main() {
    std::cout << minimumTotal({{2}, {3, 4}, {6, 5, 7}, {4, 1, 8, 3}}) << '\n';  // 11
}
