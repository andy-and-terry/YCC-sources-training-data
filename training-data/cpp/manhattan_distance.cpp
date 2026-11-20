#include <cstdlib>
#include <iostream>
#include <numeric>
#include <vector>
// Manhattan distance via std::transform_reduce-style inner_product.
int manhattan(const std::vector<int>& a, const std::vector<int>& b) {
    return std::inner_product(a.begin(), a.end(), b.begin(), 0, std::plus<>(),
                              [](int x, int y) { return std::abs(x - y); });
}
int main() { std::cout << manhattan({1, 2}, {4, 6}) << '\n'; }
