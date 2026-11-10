#include <iostream>

int tau(int n) {
    int c = 0;
    for (int d = 1; d <= n; ++d) if (n % d == 0) ++c;
    return c;
}

int main() {
    for (int n = 1; n < 60; ++n) if (n % tau(n) == 0) std::cout << n << ' ';
    std::cout << '\n';  // 1 2 8 9 12 18 24 36 40 56
}
