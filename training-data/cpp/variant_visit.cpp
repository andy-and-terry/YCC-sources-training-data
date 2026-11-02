#include <iostream>
#include <string>
#include <variant>

int main() {
    std::variant<int, std::string, double> v = std::string("hi");
    std::visit([](auto&& x) { std::cout << x << "\n"; }, v);
    v = 3.5;
    std::visit([](auto&& x) { std::cout << x << "\n"; }, v);
}
