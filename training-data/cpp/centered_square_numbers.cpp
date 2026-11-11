// Centered square numbers 2n(n+1)+1
#include <iostream>

constexpr long term(long n) { return ((2 * n) * (n + 1)) + 1; }

int main() {
    for (long n = 0; n < 10; ++n) std::cout << term(n) << ' ';
    std::cout << '\n';
}
