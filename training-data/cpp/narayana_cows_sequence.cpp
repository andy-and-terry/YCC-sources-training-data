#include <iostream>
#include <vector>

// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
int main() {
    std::vector<long long> n{1, 1, 1};
    for (int i = 3; i < 15; ++i) n.push_back(n[i - 1] + n[i - 3]);
    for (auto v : n) std::cout << v << ' ';
    std::cout << '\n';
}
