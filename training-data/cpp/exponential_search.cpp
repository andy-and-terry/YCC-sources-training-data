#include <algorithm>
#include <iostream>
#include <optional>
#include <vector>

template <typename T>
std::optional<std::size_t> exponential_search(const std::vector<T>& a, const T& target) {
    if (a.empty()) return std::nullopt;
    std::size_t bound = 1;
    while (bound < a.size() && a[bound] < target) bound *= 2;
    auto lo = a.begin() + static_cast<long>(bound / 2);
    auto hi = a.begin() + static_cast<long>(std::min(bound + 1, a.size()));
    auto it = std::lower_bound(lo, hi, target);
    if (it != hi && *it == target) return static_cast<std::size_t>(it - a.begin());
    return std::nullopt;
}

int main() {
    std::vector<int> v;
    for (int i = 0; i < 67; ++i) v.push_back(i * 3);
    for (int t : {99, 100, 0}) {
        auto r = exponential_search(v, t);
        std::cout << t << " -> " << (r ? std::to_string(*r) : "not found") << '\n';
    }
}
