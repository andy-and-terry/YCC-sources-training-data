#include <array>
#include <iostream>

consteval int square(int n) { return n * n; }

constexpr int fib(int n) { return n < 2 ? n : fib(n - 1) + fib(n - 2); }

constexpr auto make_table() {
    std::array<int, 8> t{};
    for (int i = 0; i < 8; ++i) t[i] = fib(i);
    return t;
}

int main() {
    constexpr int s = square(12);
    constexpr auto table = make_table();
    static_assert(s == 144);
    static_assert(table[7] == 13);
    std::cout << s << "\n";
    for (int x : table) std::cout << x << ' ';
    std::cout << "\n";
}
