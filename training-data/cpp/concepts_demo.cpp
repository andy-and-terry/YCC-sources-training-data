#include <iostream>
#include <concepts>

template <typename T>
concept Numeric = std::integral<T> || std::floating_point<T>;

template <Numeric T>
T square(T value) {
    return value * value;
}

template <typename T>
requires Numeric<T>
T cube(T value) {
    return value * value * value;
}

int main() {
    std::cout << square(4) << std::endl;
    std::cout << square(2.5) << std::endl;
    std::cout << cube(3) << std::endl;
    return 0;
}
