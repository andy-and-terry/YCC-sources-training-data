#include <iostream>
#include <string>
#include <type_traits>

template <typename T>
std::string describe(const T &v) {
    if constexpr (std::is_integral_v<T>) return "integer " + std::to_string(v);
    else if constexpr (std::is_floating_point_v<T>) return "float " + std::to_string(v);
    else return "other";
}

int main() {
    std::cout << describe(42) << "\n" << describe(3.5) << "\n" << describe(std::string("x")) << "\n";
}
