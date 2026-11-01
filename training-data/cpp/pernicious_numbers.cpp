#include <bitset>
#include <iostream>

constexpr bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d)
        if (n % d == 0) return false;
    return true;
}

// Pernicious numbers: the popcount is prime.
int main() {
    for (unsigned n = 1; n <= 20; ++n)
        if (isPrime(static_cast<int>(std::bitset<32>(n).count()))) std::cout << n << ' ';
    std::cout << '\n';
}
