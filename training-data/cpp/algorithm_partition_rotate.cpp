#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> v(10);
    std::iota(v.begin(), v.end(), 1);
    auto mid = std::stable_partition(v.begin(), v.end(), [](int n) { return n % 2 == 0; });
    std::cout << "evens: " << (mid - v.begin()) << "\n";
    std::rotate(v.begin(), v.begin() + 2, v.end());
    for (int n : v) std::cout << n << ' ';
    std::cout << "\n";
    auto [lo, hi] = std::minmax_element(v.begin(), v.end());
    std::cout << *lo << " " << *hi << "\n";
}
