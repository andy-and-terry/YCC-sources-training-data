#include <bitset>
#include <iostream>
#include <string>

// Thue-Morse: t(n) is the parity of the number of 1 bits in n
int main() {
    std::string out;
    for (unsigned n = 0; n < 32; ++n)
        out += static_cast<char>('0' + std::bitset<32>(n).count() % 2);
    std::cout << out << '\n';
}
