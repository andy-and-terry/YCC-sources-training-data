#include <iostream>
#include <string>
#include <variant>

template <class... Ts> struct overloaded : Ts... { using Ts::operator()...; };
template <class... Ts> overloaded(Ts...) -> overloaded<Ts...>;

int main() {
    std::variant<int, std::string, double> v = std::string("hi");
    auto show = overloaded{
        [](int i) { std::cout << "int " << i << '\n'; },
        [](const std::string& s) { std::cout << "string " << s << '\n'; },
        [](double d) { std::cout << "double " << d << '\n'; }};
    std::visit(show, v);
    v = 2.5;
    std::visit(show, v);
}
