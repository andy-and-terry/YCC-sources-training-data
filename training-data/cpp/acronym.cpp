#include <cctype>
#include <iostream>
#include <string>

std::string abbreviate(const std::string& phrase) {
    std::string out;
    bool start = true;
    for (unsigned char c : phrase) {
        if (std::isalpha(c)) {
            if (start) out += static_cast<char>(std::toupper(c));
            start = false;
        } else if (c != '\'') {
            start = true;
        }
    }
    return out;
}

int main() {
    std::cout << abbreviate("Portable Network Graphics") << '\n'
              << abbreviate("Complementary metal-oxide semiconductor") << '\n';
}
