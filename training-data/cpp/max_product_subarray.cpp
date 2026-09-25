#include <algorithm>
#include <iostream>
#include <vector>

long long max_product(const std::vector<int>& a) {
    long long best = a[0], hi = a[0], lo = a[0];
    for (std::size_t i = 1; i < a.size(); ++i) {
        long long x = a[i];
        auto cands = {x, hi * x, lo * x};
        hi = std::max(cands);
        lo = std::min(cands);
        best = std::max(best, hi);
    }
    return best;
}

int main() {
    std::cout << max_product({2, 3, -2, 4}) << ' ' << max_product({-2, 0, -1}) << ' ' << max_product({-2, 3, -4}) << ' '
              << max_product({1, -2, -3, 0, 7, -8, -2}) << '\n';
}
