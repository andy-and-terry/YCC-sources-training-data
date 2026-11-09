#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> v{5, 2, 8, 1, 9};
    std::sort(v.begin(), v.end());
    std::cout << std::accumulate(v.begin(), v.end(), 0) << " "
              << *std::max_element(v.begin(), v.end()) << " "
              << std::binary_search(v.begin(), v.end(), 8) << "\n";
    auto it = std::lower_bound(v.begin(), v.end(), 5);
    std::cout << (it - v.begin()) << "\n";
}
