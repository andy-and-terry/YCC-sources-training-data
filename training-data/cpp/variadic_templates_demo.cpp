#include <iostream>

template <typename T>
T sumAll(T value) {
    return value;
}

template <typename T, typename... Rest>
T sumAll(T first, Rest... rest) {
    return first + sumAll(rest...);
}

template <typename... Args>
void printAll(Args... args) {
    ((std::cout << args << " "), ...);   // C++17 fold expression
    std::cout << std::endl;
}

int main() {
    std::cout << sumAll(1, 2, 3, 4, 5) << std::endl;
    std::cout << sumAll(1.5, 2.5, 3.0) << std::endl;
    printAll("a", 1, 'b', 2.5);
    return 0;
}
