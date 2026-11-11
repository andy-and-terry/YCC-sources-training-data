// Square pyramidal numbers n(n+1)(2n+1)/6
#include <iostream>

constexpr long term(long n) { return ((n * (n + 1)) * ((2 * n) + 1))/6; }

int main() {
    for (long n = 0; n < 10; ++n) std::cout << term(n) << ' ';
    std::cout << '\n';
}
