#include <iostream>

// n(2n^2+1)/3
constexpr long term(long n) {
    return (n * (((2 * n) * n) + 1)) / 3;
}

int main() {
    for (long n = 1; n <= 15; ++n)
        std::cout << n << " -> " << term(n) << '\n';
    return 0;
}
