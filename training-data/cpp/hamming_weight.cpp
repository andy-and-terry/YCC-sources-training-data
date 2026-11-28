#include <bit>
#include <bitset>
#include <iostream>

int popcount(unsigned long n) {
    int c = 0;
    for (; n; n &= n - 1) ++c;
    return c;
}

int main() {
    std::cout << popcount(0xB7) << " " << std::popcount(0xB7u) << " "
              << std::bitset<8>(0xB7).count() << "\n";
}
