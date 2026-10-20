#include <array>
#include <iostream>

constexpr unsigned long long fact(unsigned n) { return n <= 1 ? 1 : n * fact(n - 1); }

constexpr auto make_table() {
    std::array<unsigned long long, 10> t{};
    for (unsigned i = 0; i < t.size(); ++i) t[i] = fact(i);
    return t;
}

int main() {
    constexpr auto table = make_table();
    static_assert(table[5] == 120);
    for (auto v : table) std::cout << v << ' ';
    std::cout << '\n';
}
