// Integer (1..3999) to Roman numeral using a greedy table.
#include <iostream>
#include <string>
#include <utility>
#include <vector>

std::string to_roman(int n) {
    static const std::vector<std::pair<int, const char*>> table = {
        {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"},
        {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}};
    std::string out;
    for (auto& [value, symbol] : table)
        while (n >= value) { out += symbol; n -= value; }
    return out;
}

int main() { std::cout << to_roman(1994) << ' ' << to_roman(58) << '\n'; }
