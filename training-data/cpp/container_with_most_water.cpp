#include <algorithm>
#include <iostream>
#include <tuple>
#include <vector>

std::tuple<int, std::size_t, std::size_t> max_area(const std::vector<int>& h) {
    std::size_t lo = 0, hi = h.size() - 1, bl = 0, br = 0;
    int best = 0;
    while (lo < hi) {
        int area = static_cast<int>(hi - lo) * std::min(h[lo], h[hi]);
        if (area > best) best = area, bl = lo, br = hi;
        h[lo] < h[hi] ? ++lo : --hi;
    }
    return {best, bl, br};
}

int main() {
    auto [area, l, r] = max_area({1, 8, 6, 2, 5, 4, 8, 3, 7});
    std::cout << "area " << area << " between " << l << " and " << r << '\n';
}
