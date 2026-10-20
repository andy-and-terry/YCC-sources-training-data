#include <iostream>
#include <type_traits>

template <typename T> std::enable_if_t<std::is_integral_v<T>, std::string> kind(T) { return "integral"; }
template <typename T> std::enable_if_t<std::is_floating_point_v<T>, std::string> kind(T) { return "float"; }

template <typename T> void f(T x) {
    if constexpr (std::is_pointer_v<T>) std::cout << "ptr\n"; else std::cout << "val\n";
}

int main() { std::cout << kind(1) << kind(2.0) << "\n"; int i; f(&i); f(i); }
