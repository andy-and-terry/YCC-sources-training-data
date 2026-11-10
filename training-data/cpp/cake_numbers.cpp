#include <iostream>

constexpr int cake(int n) { return (n * n * n + 5 * n + 6) / 6; }

int main() {
    for (int n = 0; n < 10; ++n) std::cout << cake(n) << ' ';
    std::cout << '\n';  // 1 2 4 8 15 26 42 64 93 130
}
