#include <cctype>
#include <iostream>
#include <string>

std::string compress(const std::string& s) {
    std::string out;
    for (std::size_t i = 0; i < s.size();) {
        std::size_t j = i;
        while (j < s.size() && s[j] == s[i]) ++j;
        out += s[i];
        out += std::to_string(j - i);
        i = j;
    }
    return out.size() < s.size() ? out : s;
}

std::string decompress(const std::string& s) {
    std::string out;
    for (std::size_t i = 0; i < s.size();) {
        char c = s[i++];
        std::size_t start = i;
        while (i < s.size() && std::isdigit(static_cast<unsigned char>(s[i]))) ++i;
        out.append(std::stoul(s.substr(start, i - start)), c);
    }
    return out;
}

int main() {
    for (std::string w : {"aabcccccaaa", "abc", "zzzzzzzzzzzz"}) {
        auto c = compress(w);
        std::cout << w << " -> " << c;
        if (c != w) std::cout << " -> " << decompress(c);
        std::cout << '\n';
    }
}
