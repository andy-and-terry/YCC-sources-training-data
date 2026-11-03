#include <cctype>
#include <iostream>
#include <map>
#include <string>

int main() {
    std::map<char, int> counts;
    for (unsigned char c : std::string("Education is beautiful")) {
        c = std::tolower(c);
        if (std::string("aeiou").find(c) != std::string::npos) ++counts[c];
    }
    for (auto& [v, n] : counts) std::cout << v << '=' << n << ' ';
    std::cout << '\n';
}
