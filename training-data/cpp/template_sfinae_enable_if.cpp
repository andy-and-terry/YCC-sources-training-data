#include <iostream>
#include <type_traits>

template <typename T>
std::enable_if_t<std::is_integral_v<T>, const char*> kind(T) { return "integral"; }
template <typename T>
std::enable_if_t<std::is_floating_point_v<T>, const char*> kind(T) { return "float"; }

int main() { std::cout << kind(1) << " " << kind(1.5) << "\n"; }
