#include <iostream>
#include <string>
#include <tuple>

std::tuple<int, int> divmod(int a, int b) {
    return {a / b, a % b};
}

std::tuple<std::string, int, double> record() {
    return std::make_tuple("widget", 3, 2.5);
}

int main() {
    auto [q, r] = divmod(17, 5);
    std::cout << q << " r " << r << "\n";

    std::string name;
    int qty;
    double price;
    std::tie(name, qty, price) = record();
    std::cout << name << " x" << qty << " @ " << price << "\n";

    int ignored;
    std::tie(ignored, std::ignore) = divmod(9, 2);
    std::cout << "quotient only: " << ignored << "\n";

    auto t = record();
    std::cout << std::get<0>(t) << " " << std::get<2>(t) << "\n";
    std::cout << "size: " << std::tuple_size<decltype(t)>::value << "\n";
    std::cout << (std::make_tuple(1, "a") < std::make_tuple(1, "b")) << "\n";
    return 0;
}
