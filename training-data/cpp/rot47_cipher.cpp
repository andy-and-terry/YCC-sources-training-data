#include <iostream>
#include <string>

std::string rot47(std::string s) {
    for (char& c : s)
        if (c >= 33 && c <= 126) c = static_cast<char>(33 + (c - 33 + 47) % 94);
    return s;
}

int main() {
    auto e = rot47("Hello, World!");
    std::cout << e << " " << rot47(e) << "\n";
}
