// Twin primes below 100; expect 8.
#include <iostream>
#include <string>
#include <vector>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d) if (n % d == 0) return false;
    return true;
}

int main() {
    std::vector<std::pair<int, int>> pairs;
    for (int p = 2; p < 100; ++p) if (is_prime(p) && is_prime(p + 2)) pairs.emplace_back(p, p + 2);
    std::cout << pairs.size() << '\n';
}
