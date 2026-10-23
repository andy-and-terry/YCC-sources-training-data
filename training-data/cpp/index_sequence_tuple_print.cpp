#include <iostream>
#include <string>
#include <tuple>
#include <utility>

// Expand a tuple into comma separated output using std::index_sequence
template <typename Tuple, std::size_t... I>
void printImpl(std::ostream& os, const Tuple& t, std::index_sequence<I...>) {
    ((os << (I == 0 ? "" : ", ") << std::get<I>(t)), ...);
}

template <typename... Ts>
void printTuple(const std::tuple<Ts...>& t) {
    std::cout << '(';
    printImpl(std::cout, t, std::index_sequence_for<Ts...>{});
    std::cout << ")\n";
}

// Apply a function to every element
template <typename Tuple, typename F, std::size_t... I>
void forEachImpl(const Tuple& t, F f, std::index_sequence<I...>) {
    (f(std::get<I>(t)), ...);
}

template <typename Tuple, typename F>
void forEach(const Tuple& t, F f) {
    forEachImpl(t, f, std::make_index_sequence<std::tuple_size_v<Tuple>>{});
}

int main() {
    auto record = std::make_tuple(42, std::string("widget"), 3.5, 'x');
    printTuple(record);

    int count = 0;
    forEach(record, [&](const auto&) { ++count; });
    std::cout << "elements: " << count << '\n';

    forEach(std::make_tuple(1, 2, 3), [](int v) { std::cout << v * v << ' '; });
    std::cout << '\n';
    return 0;
}
