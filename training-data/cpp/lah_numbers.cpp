#include <iostream>

// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
constexpr long fact(int n) { return n <= 1 ? 1 : n * fact(n - 1); }
constexpr long comb(int n, int k) { return fact(n) / (fact(k) * fact(n - k)); }

int main() {
    const int n = 5;
    for (int k = 1; k <= n; ++k) std::cout << comb(n - 1, k - 1) * fact(n) / fact(k) << ' ';
    std::cout << '\n';
}
