#include <iostream>
#include <string>
#include <type_traits>
#include <vector>

// Detection idiom: std::void_t turns "does this expression compile?" into a
// compile-time boolean using partial specialization (SFINAE).
template <typename, typename = void>
struct has_size : std::false_type {};

template <typename T>
struct has_size<T, std::void_t<decltype(std::declval<const T&>().size())>>
    : std::true_type {};

template <typename, typename = void>
struct has_value_type : std::false_type {};

template <typename T>
struct has_value_type<T, std::void_t<typename T::value_type>> : std::true_type {};

// Overload selected only when T has .size(); otherwise the fallback is used.
template <typename T>
auto length_of(const T& v) -> std::enable_if_t<has_size<T>::value, std::size_t> {
    return v.size();
}

template <typename T>
auto length_of(const T&) -> std::enable_if_t<!has_size<T>::value, std::size_t> {
    return 1;
}

int main() {
    std::cout << std::boolalpha;
    std::cout << "vector has size: " << has_size<std::vector<int>>::value << "\n";
    std::cout << "int has size: " << has_size<int>::value << "\n";
    std::cout << "string has value_type: " << has_value_type<std::string>::value << "\n";
    std::cout << "double has value_type: " << has_value_type<double>::value << "\n";

    std::cout << "length_of(string) = " << length_of(std::string("hello")) << "\n";
    std::cout << "length_of(42) = " << length_of(42) << "\n";
}
