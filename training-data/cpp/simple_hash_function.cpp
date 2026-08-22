#include <cstdint>
#include <iostream>
#include <string>

uint32_t djb2Hash(const std::string& s) {
    uint32_t h = 5381;
    for (unsigned char c : s) h = ((h << 5) + h) + c;
    return h;
}

uint32_t fnv1aHash(const std::string& s) {
    uint32_t h = 0x811c9dc5;
    for (unsigned char c : s) {
        h ^= c;
        h *= 0x01000193;
    }
    return h;
}

int main() {
    std::cout << djb2Hash("hello") << " " << fnv1aHash("hello") << std::endl;
    return 0;
}
