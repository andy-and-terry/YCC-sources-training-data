#include <bitset>
#include <iostream>

int main() {
    std::bitset<8> flags(0b10110010);
    std::cout << flags << " count=" << flags.count() << "\n";
    flags.set(0);
    flags.reset(7);
    flags.flip(3);
    std::cout << flags << " any=" << flags.any() << " none=" << flags.none() << "\n";
    std::cout << "bit 1: " << flags.test(1) << " [4]: " << flags[4] << "\n";
    std::bitset<8> mask("00001111");
    std::cout << (flags & mask) << " " << (flags | mask) << " " << (flags ^ mask) << "\n";
    std::cout << (flags << 2) << " " << flags.to_ulong() << "\n";
}
