#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 2, 2, 3, 5, 5, 8};
    auto [lo, hi] = std::equal_range(v.begin(), v.end(), 2);
    std::cout << "2 occurs " << (hi - lo) << " times at [" << lo - v.begin() << ", " << hi - v.begin() << ")\n";

    std::cout << "binary_search 5: " << std::binary_search(v.begin(), v.end(), 5) << "\n";
    std::cout << "binary_search 4: " << std::binary_search(v.begin(), v.end(), 4) << "\n";

    auto ins = std::lower_bound(v.begin(), v.end(), 4);
    v.insert(ins, 4);
    for (int x : v) std::cout << x << ' ';
    std::cout << "\n";
}
