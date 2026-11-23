#include <iostream>

// 3n(n-1)+1
constexpr long term(long n) {
    return ((3 * n) * (n - 1)) + 1;
}

int main() {
    for (long n = 1; n <= 15; ++n)
        std::cout << n << " -> " << term(n) << '\n';
    return 0;
}
