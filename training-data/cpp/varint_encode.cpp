#include <cstdint>
#include <iomanip>
#include <iostream>
#include <vector>

std::vector<uint8_t> varint(uint64_t n) {
    std::vector<uint8_t> out;
    while (n >= 0x80) {
        out.push_back(static_cast<uint8_t>(n & 0x7F) | 0x80);
        n >>= 7;
    }
    out.push_back(static_cast<uint8_t>(n));
    return out;
}

int main() {
    for (auto b : varint(300)) std::cout << std::hex << std::setw(2) << std::setfill('0') << int(b) << " ";
    std::cout << "\n";
}
