#include <concepts>
#include <iostream>
#include <string>

template <typename T> concept Addable = requires(T a, T b) { { a + b } -> std::convertible_to<T>; };
template <std::integral T> T twice(T x) { return x * 2; }
template <Addable T> T sum3(T a, T b, T c) { return a + b + c; }

int main() {
    std::cout << twice(21) << " " << sum3(1, 2, 3) << " " << sum3(std::string("a"), std::string("b"), std::string("c")) << "\n";
}
