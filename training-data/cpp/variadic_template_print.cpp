#include <iostream>
#include <sstream>
#include <string>
#include <tuple>
#include <utility>

// recursive expansion
void print() { std::cout << std::endl; }

template <typename T, typename... Rest>
void print(const T& first, const Rest&... rest) {
    std::cout << first;
    if constexpr (sizeof...(rest) > 0) std::cout << ", ";
    print(rest...);
}

// sum with a pack expansion in a braced list
template <typename... Args>
auto sum_all(Args... args) {
    return (args + ... + 0);
}

// join with a separator using a fold over the comma operator
template <typename... Args>
std::string join(const std::string& sep, const Args&... args) {
    std::ostringstream out;
    bool first = true;
    ((out << (first ? "" : sep) << args, first = false), ...);
    return out.str();
}

// apply a function to every element of a tuple
template <typename Tuple, typename F, std::size_t... I>
void for_each_impl(const Tuple& t, F f, std::index_sequence<I...>) {
    (f(std::get<I>(t)), ...);
}

template <typename... Ts, typename F>
void for_each_tuple(const std::tuple<Ts...>& t, F f) {
    for_each_impl(t, f, std::index_sequence_for<Ts...>{});
}

int main() {
    print(1, "two", 3.5, 'c');
    std::cout << sum_all(1, 2, 3, 4) << std::endl;
    std::cout << join(" | ", "a", 1, 2.5, "z") << std::endl;
    for_each_tuple(std::make_tuple(1, "x", 2.5), [](const auto& v) { std::cout << "[" << v << "]"; });
    std::cout << std::endl;
    return 0;
}
