#include <iostream>

template <typename T>
T sum(T value) {
    return value;
}

template <typename T, typename... Rest>
T sum(T first, Rest... rest) {
    return first + sum(rest...);
}

template <typename... Args>
auto foldSum(Args... args) {
    return (args + ...);
}

int main() {
    std::cout << sum(1, 2, 3, 4, 5) << std::endl;
    std::cout << sum(1.5, 2.5, 3.0) << std::endl;
    std::cout << foldSum(10, 20, 30) << std::endl;
    return 0;
}
