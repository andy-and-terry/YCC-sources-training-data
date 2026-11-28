#include <array>
#include <cstdint>
#include <iostream>
#include <string>

int bitap(const std::string& text, const std::string& pat) {
    std::array<uint64_t, 256> masks{};
    for (size_t i = 0; i < pat.size(); i++) masks[(unsigned char)pat[i]] |= 1ULL << i;
    uint64_t state = 0, goal = 1ULL << (pat.size() - 1);
    for (size_t i = 0; i < text.size(); i++) {
        state = ((state << 1) | 1) & masks[(unsigned char)text[i]];
        if (state & goal) return int(i - pat.size() + 1);
    }
    return -1;
}

int main() { std::cout << bitap("the quick brown fox", "brown") << '\n'; }
