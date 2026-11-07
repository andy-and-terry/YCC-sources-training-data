#include <iostream>
#include <numeric>
#include <vector>

int equilibriumIndex(const std::vector<int>& a) {
    long total = std::accumulate(a.begin(), a.end(), 0L), left = 0;
    for (std::size_t i = 0; i < a.size(); ++i) {
        if (left == total - left - a[i]) return static_cast<int>(i);
        left += a[i];
    }
    return -1;
}

int main() {
    std::cout << equilibriumIndex({1, 7, 3, 6, 5, 6}) << '\n';  // 3
}
