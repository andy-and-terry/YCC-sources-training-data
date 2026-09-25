#include <algorithm>
#include <cctype>
#include <iostream>
#include <string>

std::string atbash(std::string s) {
    std::transform(s.begin(), s.end(), s.begin(), [](unsigned char c) -> char {
        if (std::islower(c)) return static_cast<char>('z' - (c - 'a'));
        if (std::isupper(c)) return static_cast<char>('Z' - (c - 'A'));
        return static_cast<char>(c);
    });
    return s;
}

int main() {
    auto enc = atbash("Hello, World!");
    std::cout << enc << " | " << atbash(enc) << '\n';
}
