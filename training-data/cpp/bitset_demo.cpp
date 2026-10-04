#include <bitset>
#include <iostream>

int main() {
    std::bitset<8> flags;
    flags.set(0);
    flags.set(3);
    flags[5] = true;

    std::cout << flags << " count=" << flags.count() << "\n";
    std::cout << "bit 3 set? " << flags.test(3) << "\n";

    flags.flip();
    std::cout << "flipped: " << flags << "\n";
    flags.reset(7);
    std::cout << "any: " << flags.any() << " none: " << flags.none() << "\n";

    std::bitset<8> a("11001100"), b("10101010");
    std::cout << (a & b) << " " << (a | b) << " " << (a ^ b) << "\n";
    std::cout << (a << 2) << " " << (a >> 3) << "\n";
    std::cout << "value: " << std::bitset<8>("00101010").to_ulong() << "\n";
    return 0;
}
