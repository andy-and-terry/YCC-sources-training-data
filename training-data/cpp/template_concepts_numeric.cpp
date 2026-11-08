#include <concepts>
#include <iostream>

template <typename T>
concept Numeric = std::integral<T> || std::floating_point<T>;

template <Numeric T>
T square(T x) { return x * x; }

int main() {
    std::cout << square(7) << " " << square(1.5) << "\n";
}
