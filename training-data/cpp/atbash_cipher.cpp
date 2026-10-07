#include <cctype>
#include <iostream>
#include <string>

std::string transform(const std::string& s) {
    std::string out;
    for (unsigned char c : s) {
        if (std::isalpha(c)) out += static_cast<char>('z' - (std::tolower(c) - 'a'));
        else if (std::isdigit(c)) out += static_cast<char>(c);
    }
    return out;
}

std::string encode(const std::string& s) {
    std::string t = transform(s), out;
    for (size_t i = 0; i < t.size(); ++i) {
        if (i && i % 5 == 0) out += ' ';
        out += t[i];
    }
    return out;
}

int main() {
    auto e = encode("The quick brown fox");
    std::cout << e << " -> " << transform(e) << '\n';
}
