#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <vector>

int chebyshev(const std::vector<int>& a, const std::vector<int>& b) {
    int m = 0;
    for (size_t i = 0; i < a.size(); ++i) m = std::max(m, std::abs(a[i] - b[i]));
    return m;
}

int main() { std::cout << chebyshev({1, 2}, {4, 6}) << "\n"; }
