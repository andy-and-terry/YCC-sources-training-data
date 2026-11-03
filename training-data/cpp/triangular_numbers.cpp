#include <iostream>

constexpr int triangular(int n) { return n * (n + 1) / 2; }

int main() {
    static_assert(triangular(10) == 55);
    for (int n = 1; n <= 10; ++n) std::cout << triangular(n) << ' ';
    std::cout << '\n';
}
