#include <cstdlib>
#include <iostream>
#include <numeric>
#include <vector>

int manhattan(const std::vector<int>& a, const std::vector<int>& b) {
    return std::transform_reduce(a.begin(), a.end(), b.begin(), 0, std::plus<>(),
                                 [](int x, int y) { return std::abs(x - y); });
}

int main() { std::cout << manhattan({1, 2}, {4, 6}) << "\n"; }
