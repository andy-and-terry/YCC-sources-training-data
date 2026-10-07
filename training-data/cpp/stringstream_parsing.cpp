#include <iostream>
#include <sstream>
#include <string>
#include <vector>

std::vector<std::string> split(const std::string& s, char delim) {
    std::vector<std::string> parts;
    std::stringstream ss(s);
    std::string item;
    while (std::getline(ss, item, delim)) parts.push_back(item);
    return parts;
}

int main() {
    for (auto& p : split("alpha,beta,,gamma", ',')) std::cout << "[" << p << "]";
    std::cout << "\n";

    std::istringstream in("42 3.5 hello");
    int i; double d; std::string w;
    in >> i >> d >> w;
    std::cout << i << " " << d << " " << w << "\n";

    std::ostringstream out;
    out << "total=" << 7 * 6;
    std::cout << out.str() << "\n";
}
