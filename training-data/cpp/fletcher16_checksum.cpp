#include <cstdint>
#include <iostream>
#include <string_view>

std::uint16_t fletcher16(std::string_view data) {
    std::uint16_t s1 = 0, s2 = 0;
    for (unsigned char b : data) {
        s1 = (s1 + b) % 255;
        s2 = (s2 + s1) % 255;
    }
    return static_cast<std::uint16_t>((s2 << 8) | s1);
}

int main() {
    std::cout << std::hex << fletcher16("abcde") << '\n';
}
