#include <algorithm>
#include <iostream>
#include <iterator>
#include <numeric>
#include <vector>

template <typename C>
void show(const char* label, const C& c) {
    std::cout << label << ": ";
    for (auto v : c) std::cout << v << ' ';
    std::cout << std::endl;
}

int main() {
    std::vector<int> v(10);
    std::iota(v.begin(), v.end(), 1);
    show("start", v);

    std::rotate(v.begin(), v.begin() + 3, v.end());
    show("rotate left 3", v);

    std::rotate(v.rbegin(), v.rbegin() + 2, v.rend());
    show("rotate right 2", v);

    auto mid = std::partition(v.begin(), v.end(), [](int x) { return x % 2 == 0; });
    std::cout << "evens: " << (mid - v.begin()) << std::endl;

    std::stable_partition(v.begin(), v.end(), [](int x) { return x > 5; });
    show("stable partition", v);

    std::sort(v.begin(), v.end());
    auto lo = std::lower_bound(v.begin(), v.end(), 4);
    auto hi = std::upper_bound(v.begin(), v.end(), 7);
    std::cout << "range [4,7]: " << (lo - v.begin()) << ".." << (hi - v.begin()) << std::endl;
    std::cout << "binary_search 8: " << std::binary_search(v.begin(), v.end(), 8) << std::endl;

    std::vector<int> unique_vals = {1, 1, 2, 2, 2, 3, 1, 1};
    unique_vals.erase(std::unique(unique_vals.begin(), unique_vals.end()), unique_vals.end());
    show("unique", unique_vals);

    std::reverse(v.begin(), v.end());
    show("reversed", v);
    return 0;
}
