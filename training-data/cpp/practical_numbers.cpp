#include <cstdint>
#include <iostream>

// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
bool isPractical(int n) {
    std::uint64_t reach = 1;  // bit i set <=> i is a subset sum
    for (int d = 1; d <= n; ++d)
        if (n % d == 0) reach |= reach << d;
    std::uint64_t mask = (std::uint64_t{1} << (n + 1)) - 1;
    return (reach & mask) == mask;
}

int main() {
    for (int n = 1; n <= 40; ++n)
        if (isPractical(n)) std::cout << n << ' ';
    std::cout << '\n';
}
