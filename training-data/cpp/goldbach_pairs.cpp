// Goldbach partitions of 100; expect 6.
#include <iostream>
#include <string>
#include <vector>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d) if (n % d == 0) return false;
    return true;
}

int main() {
    std::vector<std::pair<int, int>> out;
    for (int p = 2; p <= 50; ++p) if (is_prime(p) && is_prime(100 - p)) out.emplace_back(p, 100 - p);
    for (auto& [a, b] : out) std::cout << a << '+' << b << ' ';
    std::cout << '\n' << out.size() << '\n';
}
