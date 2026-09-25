#include <array>
#include <iostream>
#include <string>
#include <vector>

std::vector<std::string> letter_combinations(const std::string& digits) {
    static const std::array<std::string, 10> keys{"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
    if (digits.empty()) return {};
    std::vector<std::string> out{""};
    for (char d : digits) {
        std::vector<std::string> next;
        for (const auto& prefix : out)
            for (char c : keys[static_cast<std::size_t>(d - '0')]) next.push_back(prefix + c);
        out.swap(next);
    }
    return out;
}

int main() {
    for (const auto& s : letter_combinations("23")) std::cout << s << ' ';
    std::cout << '\n' << letter_combinations("7979").size() << '\n';
}
