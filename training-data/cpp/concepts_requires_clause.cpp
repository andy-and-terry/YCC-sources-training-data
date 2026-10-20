#include <concepts>
#include <iostream>

// C++20 concepts constrain templates with readable requirements.
template <typename T>
concept Numeric = std::integral<T> || std::floating_point<T>;

template <Numeric T>
T twice(T x) { return x * 2; }

template <typename T>
requires requires(T t) { { t.size() } -> std::convertible_to<std::size_t>; }
std::size_t sizeOf(const T& t) { return t.size(); }

#include <string>
int main() {
    std::cout << twice(21) << " " << twice(1.5) << " " << sizeOf(std::string("abc")) << "\n";
}
