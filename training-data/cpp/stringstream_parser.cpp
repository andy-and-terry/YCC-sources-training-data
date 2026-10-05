#include <iostream>
#include <sstream>
#include <string>
#include <vector>

std::vector<std::string> split(const std::string &line, char delim) {
    std::vector<std::string> parts;
    std::stringstream ss(line);
    std::string item;
    while (std::getline(ss, item, delim)) {
        parts.push_back(item);
    }
    return parts;
}

int main() {
    std::string csv = "alice,30,engineer";
    for (const auto &field : split(csv, ',')) {
        std::cout << "[" << field << "]" << std::endl;
    }

    std::istringstream in("42 3.14 word");
    int i;
    double d;
    std::string w;
    in >> i >> d >> w;
    std::cout << i << " " << d << " " << w << std::endl;

    std::ostringstream out;
    out << "total=" << i * 2 << ";";
    std::cout << out.str() << std::endl;
    return 0;
}
