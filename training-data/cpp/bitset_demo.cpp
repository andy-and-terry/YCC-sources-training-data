#include <bitset>
#include <iostream>

int main() {
    std::bitset<8> flags;
    flags.set(0);
    flags.set(3);
    flags.set(7);
    std::cout << "flags: " << flags << std::endl;
    std::cout << "count: " << flags.count() << std::endl;
    std::cout << "bit 3 set: " << std::boolalpha << flags.test(3) << std::endl;

    flags.flip();
    std::cout << "flipped: " << flags << std::endl;

    std::bitset<8> mask("00001111");
    std::cout << "and mask: " << (flags & mask) << std::endl;
    std::cout << "as number: " << (flags | mask).to_ulong() << std::endl;
    return 0;
}
