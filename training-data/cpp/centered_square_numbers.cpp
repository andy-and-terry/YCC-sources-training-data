#include <iostream>

// 2n(n-1)+1
constexpr long term(long n) {
    return ((2 * n) * (n - 1)) + 1;
}

int main() {
    for (long n = 1; n <= 15; ++n)
        std::cout << n << " -> " << term(n) << '\n';
    return 0;
}
