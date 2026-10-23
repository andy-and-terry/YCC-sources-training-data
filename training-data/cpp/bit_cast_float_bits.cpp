#include <bit>
#include <cstdint>
#include <iostream>
#include <iomanip>

int main() {
    float f = 1.0f;
    auto bits = std::bit_cast<std::uint32_t>(f);
    std::cout << std::hex << "1.0f = 0x" << bits << "\n";

    std::uint32_t sign = bits >> 31;
    std::uint32_t exponent = (bits >> 23) & 0xFF;
    std::uint32_t mantissa = bits & 0x7FFFFF;
    std::cout << std::dec << "sign=" << sign << " exp=" << exponent
              << " mantissa=" << mantissa << "\n";

    float back = std::bit_cast<float>(std::uint32_t{0x40490fdb});
    std::cout << std::setprecision(7) << back << "\n";
}
