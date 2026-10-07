#include <iostream>
#include <optional>
#include <utility>
#include <vector>

std::optional<std::pair<size_t, size_t>> pairWithSum(const std::vector<int>& a, int target) {
    if (a.empty()) return std::nullopt;
    size_t i = 0, j = a.size() - 1;
    while (i < j) {
        int s = a[i] + a[j];
        if (s == target) return std::make_pair(i, j);
        s < target ? ++i : --j;
    }
    return std::nullopt;
}

int main() {
    if (auto p = pairWithSum({1, 3, 4, 6, 8, 11}, 10)) std::cout << p->first << ',' << p->second << '\n';
    std::cout << pairWithSum({1, 2, 3}, 100).has_value() << '\n';
}
