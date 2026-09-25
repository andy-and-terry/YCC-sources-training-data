#include <algorithm>
#include <iostream>
#include <vector>

long long maxProduct(const std::vector<long long>& a) {
    long long best = a[0], hi = a[0], lo = a[0];
    for (size_t i = 1; i < a.size(); ++i) {
        long long x = a[i];
        if (x < 0) std::swap(hi, lo);
        hi = std::max(x, hi * x);
        lo = std::min(x, lo * x);
        best = std::max(best, hi);
    }
    return best;
}

int main() {
    std::cout << maxProduct({2, 3, -2, 4}) << ' ' << maxProduct({-2, 0, -1}) << ' ' << maxProduct({-2, 3, -4}) << '\n';
}
