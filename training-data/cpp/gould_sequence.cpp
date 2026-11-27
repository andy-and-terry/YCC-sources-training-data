#include <bit>
#include <iostream>

constexpr unsigned gould(unsigned n) { return 1u << std::popcount(n); }

int main() {
    for (unsigned n = 0; n < 16; ++n) std::cout << gould(n) << ' ';
    std::cout << '\n';
}
