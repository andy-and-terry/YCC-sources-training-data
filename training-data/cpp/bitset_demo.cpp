#include <bitset>
#include <iostream>
#include <string>

int main() {
    std::bitset<8> flags;
    flags.set(0);
    flags.set(3);
    flags[5] = true;

    std::cout << "flags      : " << flags << std::endl;
    std::cout << "count      : " << flags.count() << std::endl;
    std::cout << "test(3)    : " << flags.test(3) << std::endl;
    std::cout << "any / none : " << flags.any() << " / " << flags.none() << std::endl;

    flags.flip(0);
    std::cout << "after flip : " << flags << std::endl;

    std::bitset<8> mask("00101000");
    std::cout << "and        : " << (flags & mask) << std::endl;
    std::cout << "or         : " << (flags | mask) << std::endl;
    std::cout << "xor        : " << (flags ^ mask) << std::endl;
    std::cout << "shift left : " << (flags << 2) << std::endl;

    std::bitset<16> value(0xBEEF);
    std::cout << "0xBEEF     : " << value << " = " << value.to_ulong() << std::endl;
    std::cout << "as string  : " << value.to_string() << std::endl;

    // sieve of small primes using a bitset
    std::bitset<50> composite;
    for (int i = 2; i < 50; ++i) {
        if (composite[i]) continue;
        for (int j = i * i; j < 50; j += i) composite[j] = true;
    }
    for (int i = 2; i < 50; ++i) {
        if (!composite[i]) std::cout << i << ' ';
    }
    std::cout << std::endl;
    return 0;
}
