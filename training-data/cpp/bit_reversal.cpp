#include <bitset>
#include <cstdint>
#include <iostream>

std::uint8_t reverseBits(std::uint8_t v) {
    std::uint8_t r = 0;
    for (int i = 0; i < 8; ++i) {
        r = static_cast<std::uint8_t>((r << 1) | (v & 1));
        v >>= 1;
    }
    return r;
}

int main() {
    for (int v : {1, 6, 13, 128}) {
        auto r = reverseBits(static_cast<std::uint8_t>(v));
        std::cout << v << " -> " << static_cast<int>(r) << " " << std::bitset<8>(r) << '\n';
    }
}
