#include <array>
#include <iostream>

constexpr auto make_fibs() {
    std::array<unsigned long long, 20> a{};
    a[0] = 0; a[1] = 1;
    for (int i = 2; i < 20; i++) a[i] = a[i - 1] + a[i - 2];
    return a;
}

int main() {
    constexpr auto fibs = make_fibs();
    static_assert(fibs[10] == 55);
    std::cout << fibs[19] << "\n";
}
