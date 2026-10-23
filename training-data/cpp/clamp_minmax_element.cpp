#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::cout << std::clamp(15, 0, 10) << " " << std::clamp(-3, 0, 10)
              << " " << std::clamp(7, 0, 10) << "\n";

    std::vector<int> v{4, 9, 1, 7, 9, 1};
    auto [lo, hi] = std::minmax_element(v.begin(), v.end());
    std::cout << "min=" << *lo << " at " << lo - v.begin()
              << ", max=" << *hi << " at " << hi - v.begin() << "\n";

    auto [a, b] = std::minmax({3, 8, 2, 6});
    std::cout << a << " " << b << "\n";
}
