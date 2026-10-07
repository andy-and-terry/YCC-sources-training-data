#include <array>
#include <cstdint>
#include <iostream>
#include <string>

std::string min_window(const std::string& s, const std::string& t) {
    std::array<int, 256> need{};
    for (unsigned char c : t) ++need[c];
    int missing = static_cast<int>(t.size());
    std::size_t best_l = 0, best_len = SIZE_MAX;
    for (std::size_t l = 0, r = 0; r < s.size(); ++r) {
        if (need[static_cast<unsigned char>(s[r])]-- > 0) --missing;
        while (missing == 0) {
            if (r - l + 1 < best_len) best_l = l, best_len = r - l + 1;
            if (++need[static_cast<unsigned char>(s[l++])] > 0) ++missing;
        }
    }
    return best_len == SIZE_MAX ? "" : s.substr(best_l, best_len);
}

int main() {
    std::cout << '"' << min_window("ADOBECODEBANC", "ABC") << "\" \"" << min_window("a", "aa") << "\"\n";
}
