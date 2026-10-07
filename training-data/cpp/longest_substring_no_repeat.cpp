#include <iostream>
#include <string_view>
#include <unordered_map>

std::string_view longest_unique(std::string_view s) {
    std::unordered_map<char, std::size_t> last;
    std::size_t start = 0, best_start = 0, best_len = 0;
    for (std::size_t i = 0; i < s.size(); ++i) {
        if (auto it = last.find(s[i]); it != last.end() && it->second >= start) start = it->second + 1;
        last[s[i]] = i;
        if (i - start + 1 > best_len) best_len = i - start + 1, best_start = start;
    }
    return s.substr(best_start, best_len);
}

int main() {
    for (std::string_view s : {"abcabcbb", "bbbbb", "pwwkew", "dvdf"}) {
        auto r = longest_unique(s);
        std::cout << s << ' ' << r << ' ' << r.size() << '\n';
    }
}
