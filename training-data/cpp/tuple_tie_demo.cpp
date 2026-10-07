#include <iostream>
#include <string>
#include <tuple>

std::tuple<int, double, std::string> make() { return {1, 2.5, "x"}; }

int main() {
    auto t = make();
    std::cout << std::get<0>(t) << " " << std::get<2>(t) << "\n";

    int i; double d; std::string s;
    std::tie(i, d, s) = make();
    std::cout << i << " " << d << " " << s << "\n";

    std::tie(i, std::ignore, s) = make();       // skip an element
    auto a = std::make_tuple(1, "b"), b = std::make_tuple(1, "c");
    std::cout << std::boolalpha << (a < b) << "\n";   // lexicographic compare
    std::cout << std::tuple_size<decltype(t)>::value << "\n";
}
