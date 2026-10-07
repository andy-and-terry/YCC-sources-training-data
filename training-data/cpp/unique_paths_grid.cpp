#include <cstdint>
#include <iostream>
#include <vector>

std::uint64_t unique_paths(const std::vector<std::vector<int>>& grid) {
    std::vector<std::uint64_t> dp(grid[0].size(), 0);
    dp[0] = grid[0][0] == 0;
    for (const auto& row : grid)
        for (std::size_t c = 0; c < row.size(); ++c) dp[c] = row[c] ? 0 : dp[c] + (c ? dp[c - 1] : 0);
    return dp.back();
}

int main() {
    std::cout << unique_paths(std::vector<std::vector<int>>(3, std::vector<int>(7, 0))) << ' '
              << unique_paths({{0, 0, 0}, {0, 1, 0}, {0, 0, 0}}) << ' '
              << unique_paths(std::vector<std::vector<int>>(16, std::vector<int>(16, 0))) << '\n';
}
