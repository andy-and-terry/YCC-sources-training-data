#include <array>
#include <iostream>

constexpr std::array<unsigned long long, 15> make_fib() {
    std::array<unsigned long long, 15> a{};
    a[0] = 0;
    a[1] = 1;
    for (int i = 2; i < 15; ++i) a[i] = a[i - 1] + a[i - 2];
    return a;
}

constexpr auto FIB = make_fib();
static_assert(FIB[10] == 55);

int main() {
    for (auto f : FIB) std::cout << f << " ";
    std::cout << "\n";
}
