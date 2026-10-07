#include <algorithm>
#include <iostream>
#include <vector>

std::vector<int> pancake_sort(std::vector<int>& a) {
    std::vector<int> flips;
    for (auto size = a.size(); size > 1; --size) {
        auto max_it = std::max_element(a.begin(), a.begin() + static_cast<long>(size));
        auto idx = static_cast<int>(max_it - a.begin());
        if (idx == static_cast<int>(size) - 1) continue;
        if (idx > 0) {
            std::reverse(a.begin(), max_it + 1);
            flips.push_back(idx + 1);
        }
        std::reverse(a.begin(), a.begin() + static_cast<long>(size));
        flips.push_back(static_cast<int>(size));
    }
    return flips;
}

int main() {
    std::vector<int> v{23, 10, 20, 11, 12, 6, 7};
    auto flips = pancake_sort(v);
    for (int x : v) std::cout << x << ' ';
    std::cout << "| flips:";
    for (int f : flips) std::cout << ' ' << f;
    std::cout << '\n';
}
