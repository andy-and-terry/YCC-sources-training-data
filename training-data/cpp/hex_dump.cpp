#include <cctype>
#include <cstdio>
#include <string>

void hex_dump(const std::string &data) {
    for (size_t off = 0; off < data.size(); off += 16) {
        std::printf("%08zx  ", off);
        for (size_t i = 0; i < 16; ++i) {
            if (off + i < data.size()) std::printf("%02x ", static_cast<unsigned char>(data[off + i]));
            else std::printf("   ");
        }
        std::printf(" |");
        for (size_t i = 0; i < 16 && off + i < data.size(); ++i)
            std::putchar(std::isprint(static_cast<unsigned char>(data[off + i])) ? data[off + i] : '.');
        std::printf("|\n");
    }
}

int main() { hex_dump("Hello, hex dump!\n\x01\x02 end"); }
