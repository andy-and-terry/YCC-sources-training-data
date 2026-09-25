#include <bitset>
#include <bit>
#include <iostream>

constexpr unsigned to_gray(unsigned n) { return n ^ (n >> 1); }

constexpr unsigned from_gray(unsigned g) {
    for (unsigned shift = 1; shift < 32; shift <<= 1) g ^= g >> shift;
    return g;
}

static_assert(from_gray(to_gray(12345)) == 12345);

int main() {
    for (unsigned i = 0; i < 16; ++i) {
        unsigned g = to_gray(i);
        bool ok = i == 0 || std::popcount(g ^ to_gray(i - 1)) == 1;
        std::cout << i << '\t' << std::bitset<4>(g) << '\t' << from_gray(g) << (ok ? "" : " !") << '\n';
    }
}
