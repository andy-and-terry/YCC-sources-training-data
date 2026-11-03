#include <algorithm>
#include <cctype>
#include <iostream>
#include <string>

std::string swap_case(std::string s) {
    std::transform(s.begin(), s.end(), s.begin(), [](unsigned char c) {
        return std::isupper(c) ? std::tolower(c) : std::toupper(c);
    });
    return s;
}

int main() { std::cout << swap_case("Hello World 42") << '\n'; }
