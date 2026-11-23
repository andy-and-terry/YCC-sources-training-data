#include <iostream>

// n^2(n+1)/2
constexpr long term(long n) {
    return ((n * n) * (n + 1)) / 2;
}

int main() {
    for (long n = 1; n <= 15; ++n)
        std::cout << n << " -> " << term(n) << '\n';
    return 0;
}
