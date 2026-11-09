#include <iostream>
#include <type_traits>

template <class T>
std::enable_if_t<std::is_integral_v<T>, const char*> kind(T) { return "integral"; }
template <class T>
std::enable_if_t<std::is_floating_point_v<T>, const char*> kind(T) { return "float"; }

int main() { std::cout << kind(1) << " " << kind(2.0) << "\n"; }
