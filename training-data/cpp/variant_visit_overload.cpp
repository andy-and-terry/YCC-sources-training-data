#include <iostream>
#include <string>
#include <variant>

template <class... Ts> struct overloaded : Ts... { using Ts::operator()...; };
template <class... Ts> overloaded(Ts...) -> overloaded<Ts...>;

int main() {
    std::variant<int, double, std::string> v = std::string("hi");
    auto show = overloaded{
        [](int i) { std::cout << "int " << i << "\n"; },
        [](double d) { std::cout << "double " << d << "\n"; },
        [](const std::string& s) { std::cout << "string " << s << "\n"; }};
    std::visit(show, v);
    v = 3.5;
    std::visit(show, v);
}
