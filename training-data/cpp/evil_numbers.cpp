#include <bitset>
#include <iostream>

// Evil numbers have an even number of 1 bits.
int main() {
    for (unsigned n = 0; n <= 20; ++n)
        if (std::bitset<32>(n).count() % 2 == 0) std::cout << n << ' ';
    std::cout << '\n';
}
