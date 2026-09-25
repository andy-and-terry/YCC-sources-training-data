#include <bit>
#include <cstdint>
#include <iostream>
#include <stdexcept>
#include <string_view>

std::size_t hamming(std::string_view a, std::string_view b) {
    if (a.size() != b.size()) throw std::invalid_argument("length mismatch");
    std::size_t d = 0;
    for (std::size_t i = 0; i < a.size(); ++i) d += a[i] != b[i];
    return d;
}

int hamming(std::uint64_t x, std::uint64_t y) { return std::popcount(x ^ y); }

int main() {
    std::cout << hamming("karolin", "kathrin") << ' ' << hamming(1u, 4u) << ' ' << hamming(~0ull, 0ull) << '\n';
    try {
        hamming("abc", "ab");
    } catch (const std::invalid_argument& e) {
        std::cout << "error: " << e.what() << '\n';
    }
}
