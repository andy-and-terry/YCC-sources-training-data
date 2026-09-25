#include <algorithm>
#include <array>
#include <iostream>
#include <vector>

std::vector<std::array<int, 3>> three_sum(std::vector<int> a, int target = 0) {
    std::sort(a.begin(), a.end());
    std::vector<std::array<int, 3>> res;
    for (std::size_t i = 0; i + 2 < a.size(); ++i) {
        if (i && a[i] == a[i - 1]) continue;
        std::size_t lo = i + 1, hi = a.size() - 1;
        while (lo < hi) {
            int s = a[i] + a[lo] + a[hi];
            if (s < target) ++lo;
            else if (s > target) --hi;
            else {
                res.push_back({a[i], a[lo], a[hi]});
                while (lo < hi && a[lo] == a[lo + 1]) ++lo;
                while (lo < hi && a[hi] == a[hi - 1]) --hi;
                ++lo, --hi;
            }
        }
    }
    return res;
}

int main() {
    for (auto& t : three_sum({-1, 0, 1, 2, -1, -4})) std::cout << '[' << t[0] << ',' << t[1] << ',' << t[2] << "] ";
    std::cout << '\n';
    for (auto& t : three_sum({1, 2, 3, 4, 5, 6}, 10)) std::cout << '[' << t[0] << ',' << t[1] << ',' << t[2] << "] ";
    std::cout << '\n';
}
