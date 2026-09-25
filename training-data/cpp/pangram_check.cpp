#include <bitset>
#include <cctype>
#include <iostream>
#include <string>

bool isPangram(const std::string& s) {
    std::bitset<26> seen;
    for (unsigned char c : s)
        if (std::isalpha(c)) seen.set(std::tolower(c) - 'a');
    return seen.all();
}

int main() {
    std::cout << std::boolalpha << isPangram("The quick brown fox jumps over the lazy dog") << ' '
              << isPangram("Hello world") << '\n';
}
