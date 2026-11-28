#include <algorithm>
#include <iostream>
#include <vector>

int maxArea(const std::vector<int>& h) {
    int lo = 0, hi = static_cast<int>(h.size()) - 1, best = 0;
    while (lo < hi) {
        best = std::max(best, std::min(h[lo], h[hi]) * (hi - lo));
        (h[lo] < h[hi]) ? ++lo : --hi;
    }
    return best;
}

int main() {
    std::cout << maxArea({1, 8, 6, 2, 5, 4, 8, 3, 7}) << '\n';  // 49
}
