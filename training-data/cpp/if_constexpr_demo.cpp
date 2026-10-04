#include <iostream>
#include <string>
#include <type_traits>

template <typename T>
std::string describe(const T& value) {
    if constexpr (std::is_integral_v<T>) {
        return "integer " + std::to_string(value);
    } else if constexpr (std::is_floating_point_v<T>) {
        return "float " + std::to_string(value);
    } else if constexpr (std::is_same_v<T, std::string>) {
        return "string \"" + value + "\"";
    } else {
        return "something else";
    }
}

template <typename T>
constexpr T power(T base, unsigned exp) {
    if constexpr (std::is_integral_v<T>) {
        T result = 1;
        while (exp--) result *= base;
        return result;
    } else {
        return exp == 0 ? T{1} : base * power(base, exp - 1);
    }
}

int main() {
    std::cout << describe(42) << "\n";
    std::cout << describe(2.5) << "\n";
    std::cout << describe(std::string("hi")) << "\n";
    std::cout << describe('c') << "\n";
    static_assert(power(2, 10) == 1024);
    std::cout << power(3, 4) << " " << power(1.5, 2) << "\n";
    return 0;
}
