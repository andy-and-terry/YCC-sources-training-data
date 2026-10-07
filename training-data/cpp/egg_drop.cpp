#include <algorithm>
#include <iostream>
#include <vector>

// O(k * n log n) DP using binary search over the drop floor (the two halves are monotone).
int egg_drop(int eggs, int floors) {
    std::vector<std::vector<int>> dp(static_cast<std::size_t>(eggs) + 1, std::vector<int>(static_cast<std::size_t>(floors) + 1, 0));
    for (int f = 1; f <= floors; ++f) dp[1][f] = f;
    for (int e = 2; e <= eggs; ++e) {
        for (int f = 1; f <= floors; ++f) {
            int lo = 1, hi = f, best = f;
            while (lo <= hi) {
                int mid = (lo + hi) / 2;
                int breaks = dp[e - 1][mid - 1], survives = dp[e][f - mid];
                best = std::min(best, 1 + std::max(breaks, survives));
                if (breaks < survives) lo = mid + 1;
                else hi = mid - 1;
            }
            dp[e][f] = best;
        }
    }
    return dp[eggs][floors];
}

int main() {
    std::cout << egg_drop(1, 10) << ' ' << egg_drop(2, 100) << ' ' << egg_drop(3, 1000) << ' ' << egg_drop(4, 5000) << '\n';
}
