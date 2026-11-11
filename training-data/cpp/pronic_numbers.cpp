// Pronic numbers n(n+1)
#include <iostream>

constexpr long term(long n) { return n * (n + 1); }

int main() {
    for (long n = 0; n < 10; ++n) std::cout << term(n) << ' ';
    std::cout << '\n';
}
