#include <iostream>
#include <string>
#include <variant>

template <class... Ts> struct overloaded : Ts... { using Ts::operator()...; };
template <class... Ts> overloaded(Ts...) -> overloaded<Ts...>;

int main() {
    std::variant<int, std::string, double> v = std::string("hi");
    std::visit(overloaded{
        [](int i) { std::cout << "int " << i << '\n'; },
        [](const std::string& s) { std::cout << "str " << s << '\n'; },
        [](double d) { std::cout << "dbl " << d << '\n'; }}, v);
}
