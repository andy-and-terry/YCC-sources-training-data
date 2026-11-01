#include <array>
#include <iostream>

constexpr std::array<unsigned long long, 10> make_table() {
    std::array<unsigned long long, 10> t{};
    t[0] = 1;
    for (int i = 1; i < 10; ++i) t[i] = t[i - 1] * i;
    return t;
}

int main() {
    constexpr auto t = make_table();
    static_assert(t[5] == 120);
    for (auto x : t) std::cout << x << " ";
    std::cout << "\n";
}
