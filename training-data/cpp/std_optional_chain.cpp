#include <iostream>
#include <optional>
#include <string>

std::optional<int> parse(const std::string& s) {
    try { return std::stoi(s); } catch (...) { return std::nullopt; }
}

int main() {
    for (auto s : {"42", "x"}) {
        auto v = parse(s);
        std::cout << s << " -> " << v.value_or(-1) << "\n";
    }
}
