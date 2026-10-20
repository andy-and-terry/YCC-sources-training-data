#include <array>
#include <iostream>

constexpr unsigned long fib(int n) { return n < 2 ? n : fib(n - 1) + fib(n - 2); }

constexpr auto table() {
    std::array<unsigned long, 10> a{};
    for (int i = 0; i < 10; i++) a[i] = fib(i);
    return a;
}

int main() {
    constexpr auto t = table();
    static_assert(t[9] == 34);
    for (auto v : t) std::cout << v << " ";
    std::cout << "\n";
}
