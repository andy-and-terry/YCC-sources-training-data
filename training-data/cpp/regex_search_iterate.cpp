#include <iostream>
#include <regex>
#include <string>

int main() {
    std::string s = "id=12, id=345, name=x";
    std::regex re(R"((\w+)=(\d+))");
    for (std::sregex_iterator it(s.begin(), s.end(), re), end; it != end; ++it)
        std::cout << (*it)[1] << ":" << (*it)[2] << " ";
    std::cout << "\n" << std::regex_replace(s, std::regex("\\d+"), "#") << "\n";
}
