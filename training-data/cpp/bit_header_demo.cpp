#include <bit>
#include <cstdint>
#include <iostream>

int main() {
    std::uint32_t x = 0b00101100'00000000'00000000'00000000;
    std::cout << "popcount " << std::popcount(x) << "\n";
    std::cout << "leading zeros " << std::countl_zero(x) << "\n";
    std::cout << "trailing zeros " << std::countr_zero(x) << "\n";
    std::cout << "rotl 4: " << std::hex << std::rotl(0x12345678u, 8) << std::dec << "\n";
    std::cout << "is pow2(64): " << std::has_single_bit(64u) << " bit_ceil(100)=" << std::bit_ceil(100u)
              << " bit_width(255)=" << std::bit_width(255u) << "\n";
    float f = 1.0f;
    std::cout << std::hex << std::bit_cast<std::uint32_t>(f) << "\n";
}
