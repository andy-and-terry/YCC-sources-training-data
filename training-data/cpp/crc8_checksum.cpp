#include <cstdint>
#include <iomanip>
#include <iostream>
#include <string>

uint8_t crc8(const std::string& data) {
    uint8_t crc = 0;
    for (unsigned char b : data) {
        crc ^= b;
        for (int i = 0; i < 8; ++i) crc = (crc & 0x80) ? (crc << 1) ^ 0x07 : crc << 1;
    }
    return crc;
}

int main() {
    std::cout << std::hex << std::setw(2) << std::setfill('0') << int(crc8("123456789")) << "\n";
}
