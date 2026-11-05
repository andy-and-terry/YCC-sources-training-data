#include <concepts>
#include <iostream>

template <std::integral T>
T twice(T x) { return x + x; }

template <typename T>
requires std::floating_point<T>
T half(T x) { return x / 2; }

int main() {
    std::cout << twice(21) << " " << half(5.0) << "\n";
}
