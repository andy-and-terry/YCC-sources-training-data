#include <iostream>
#include <sstream>
#include <string>
#include <vector>

std::vector<std::string> split(const std::string &s, char delim) {
    std::vector<std::string> parts;
    std::istringstream in(s);
    std::string item;
    while (std::getline(in, item, delim)) parts.push_back(item);
    return parts;
}

int main() {
    for (const auto &p : split("a,b,,c", ',')) std::cout << "[" << p << "]";
    std::cout << "\n";

    std::istringstream nums("12 3.5 hello");
    int i; double d; std::string w;
    nums >> i >> d >> w;
    std::cout << i << " " << d << " " << w << "\n";

    std::ostringstream out;
    out << "x=" << 42 << ", pi=" << 3.14159;
    std::cout << out.str() << "\n";
}
