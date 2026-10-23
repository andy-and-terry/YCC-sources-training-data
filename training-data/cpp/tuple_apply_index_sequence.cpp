#include <cstddef>
#include <iostream>
#include <string>
#include <tuple>
#include <utility>

// std::apply unpacks a tuple into a function call, and std::index_sequence
// lets us walk a tuple element by element at compile time.
int add3(int a, int b, int c) { return a + b + c; }

template <typename Tuple, std::size_t... I>
void print_tuple_impl(const Tuple& t, std::index_sequence<I...>) {
    ((std::cout << (I == 0 ? "" : ", ") << std::get<I>(t)), ...);
}

template <typename... Ts>
void print_tuple(const std::tuple<Ts...>& t) {
    std::cout << "(";
    print_tuple_impl(t, std::index_sequence_for<Ts...>{});
    std::cout << ")\n";
}

int main() {
    auto args = std::make_tuple(1, 2, 3);
    std::cout << "add3 = " << std::apply(add3, args) << "\n";

    // Apply works with lambdas, including variadic ones.
    auto joiner = [](const auto&... parts) {
        std::string out;
        ((out += std::to_string(parts) + ";"), ...);
        return out;
    };
    std::cout << "joined = " << std::apply(joiner, args) << "\n";

    print_tuple(std::make_tuple(7, std::string("seven"), 7.5));
    print_tuple(std::tuple<>{});
}
