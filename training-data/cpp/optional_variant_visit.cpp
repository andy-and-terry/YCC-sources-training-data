#include <iostream>
#include <optional>
#include <string>
#include <variant>

struct Visitor {
    void operator()(int i) const { std::cout << "int " << i << "\n"; }
    void operator()(const std::string& s) const { std::cout << "str " << s << "\n"; }
};

std::optional<int> parse(const std::string& s) {
    try { return std::stoi(s); } catch (...) { return std::nullopt; }
}

int main() {
    std::variant<int, std::string> v = 5;
    std::visit(Visitor{}, v);
    v = std::string("hi");
    std::visit(Visitor{}, v);
    std::cout << parse("12").value_or(-1) << " " << parse("x").value_or(-1) << "\n";
}
