#include <concepts>
#include <iostream>
template <typename T>
concept Addable = requires(T a, T b) { { a + b } -> std::convertible_to<T>; };
template <Addable T> T twice(T x) { return x + x; }
int main() {
    std::cout << twice(21) << " " << twice(1.25) << "\n";
}
