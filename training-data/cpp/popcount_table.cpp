// Population count (number of set bits) for 0..15
#include <bitset>
#include <iostream>

int main() {
    for (unsigned n = 0; n < 16; ++n) std::cout << std::bitset<8>(n).count() << ' ';
    std::cout << '\n';
}
