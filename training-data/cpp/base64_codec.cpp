#include <iostream>
#include <string>
#include <vector>

static const std::string CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

std::string encode(const std::string& data) {
    std::string result;
    int val = 0, bits = -6;
    for (unsigned char c : data) {
        val = (val << 8) + c;
        bits += 8;
        while (bits >= 0) {
            result.push_back(CHARS[(val >> bits) & 0x3F]);
            bits -= 6;
        }
    }
    if (bits > -6) result.push_back(CHARS[((val << 8) >> (bits + 8)) & 0x3F]);
    while (result.size() % 4) result.push_back('=');
    return result;
}

std::string decode(const std::string& text) {
    std::vector<int> table(256, -1);
    for (size_t i = 0; i < CHARS.size(); i++) table[static_cast<unsigned char>(CHARS[i])] = static_cast<int>(i);
    std::string result;
    int val = 0, bits = -8;
    for (unsigned char c : text) {
        if (table[c] == -1) break;
        val = (val << 6) + table[c];
        bits += 6;
        if (bits >= 0) {
            result.push_back(static_cast<char>((val >> bits) & 0xFF));
            bits -= 8;
        }
    }
    return result;
}

int main() {
    std::string encoded = encode("hello world");
    std::cout << encoded << std::endl;
    std::cout << decode(encoded) << std::endl;
    return 0;
}
