#include <iostream>
#include <string>
#include <variant>

struct Visitor {
    void operator()(int i) const { std::cout << "int " << i << "\n"; }
    void operator()(const std::string& s) const { std::cout << "str " << s << "\n"; }
};

int main() {
    std::variant<int, std::string> v = 7;
    std::visit(Visitor{}, v);
    v = std::string("hi");
    std::visit(Visitor{}, v);
}
