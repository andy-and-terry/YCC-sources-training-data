#include <iostream>
#include <string>
#include <vector>

std::string toRoman(int n) {
    std::vector<std::pair<int, std::string>> table = {
        {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
        {100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"},
        {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}
    };

    std::string result;
    for (const auto& [value, symbol] : table) {
        while (n >= value) {
            result += symbol;
            n -= value;
        }
    }
    return result;
}

int main() {
    std::cout << toRoman(1994) << std::endl;
    std::cout << toRoman(58) << std::endl;
    std::cout << toRoman(3999) << std::endl;
    return 0;
}
