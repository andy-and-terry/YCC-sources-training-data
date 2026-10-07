#include <bitset>
#include <cctype>
#include <iostream>
#include <string>

bool isIsogram(const std::string& s) {
    std::bitset<26> seen;
    for (unsigned char c : s) {
        if (!std::isalpha(c)) continue;
        int i = std::tolower(c) - 'a';
        if (seen[i]) return false;
        seen.set(i);
    }
    return true;
}

int main() {
    for (auto w : {"lumberjacks", "background", "six-year-old", "isograms"})
        std::cout << w << ' ' << std::boolalpha << isIsogram(w) << '\n';
}
