#include <cctype>
#include <iostream>
#include <string>

int main() {
    std::string text = "Hello, World 2024! Tab\there.";
    int up = 0, low = 0, dig = 0, sp = 0, pun = 0;
    for (unsigned char c : text) {
        up += std::isupper(c) != 0;
        low += std::islower(c) != 0;
        dig += std::isdigit(c) != 0;
        sp += std::isspace(c) != 0;
        pun += std::ispunct(c) != 0;
    }
    std::cout << "upper=" << up << " lower=" << low << " digit=" << dig << " space=" << sp << " punct=" << pun << "\n";

    std::string shout = text;
    for (char& c : shout) c = static_cast<char>(std::toupper(static_cast<unsigned char>(c)));
    std::cout << shout << "\n";
    std::cout << std::isxdigit('f') << std::isalnum('_') << " " << (char)('a' + 1) << "\n";
}
