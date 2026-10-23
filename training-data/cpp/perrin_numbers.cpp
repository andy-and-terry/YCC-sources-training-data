#include <iostream>
#include <vector>

// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
int main() {
    std::vector<long long> p{3, 0, 2};
    for (int n = 3; n < 15; ++n) p.push_back(p[n - 2] + p[n - 3]);
    for (auto v : p) std::cout << v << ' ';
    std::cout << '\n';
}
