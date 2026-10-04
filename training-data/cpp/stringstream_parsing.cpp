#include <iostream>
#include <sstream>
#include <string>
#include <vector>

std::vector<std::string> split(const std::string& s, char delim) {
    std::vector<std::string> parts;
    std::istringstream stream(s);
    std::string item;
    while (std::getline(stream, item, delim)) {
        parts.push_back(item);
    }
    return parts;
}

int main() {
    for (const auto& field : split("alice,30,paris", ',')) {
        std::cout << "[" << field << "]\n";
    }

    std::istringstream nums("12 7 -3 40");
    int n, sum = 0;
    while (nums >> n) sum += n;
    std::cout << "sum = " << sum << "\n";

    std::ostringstream out;
    out << "pi~" << 3.14159 << " hex=" << std::hex << 255;
    std::cout << out.str() << "\n";
    return 0;
}
