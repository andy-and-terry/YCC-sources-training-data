#include <iostream>
#include <optional>
#include <string>

std::optional<int> parse(const std::string& s) {
    try { return std::stoi(s); } catch (...) { return std::nullopt; }
}

int main() {
    std::cout << parse("42").value_or(-1) << "\n";
    std::cout << parse("x").value_or(-1) << "\n";
}
