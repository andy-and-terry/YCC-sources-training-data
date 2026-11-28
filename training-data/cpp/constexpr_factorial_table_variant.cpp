#include <array>
#include <iostream>

constexpr std::array<unsigned long long, 10> make() {
    std::array<unsigned long long, 10> a{};
    a[0] = 1;
    for (int i = 1; i < 10; ++i) a[i] = a[i - 1] * i;
    return a;
}

int main() {
    constexpr auto t = make();
    static_assert(t[5] == 120);
    std::cout << t[9] << '\n';
}
