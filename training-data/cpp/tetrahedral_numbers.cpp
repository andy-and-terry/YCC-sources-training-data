// Tetrahedral numbers n(n+1)(n+2)/6
#include <iostream>

constexpr long term(long n) { return ((n * (n + 1)) * (n + 2))/6; }

int main() {
    for (long n = 0; n < 10; ++n) std::cout << term(n) << ' ';
    std::cout << '\n';
}
