#include <iostream>

// n(n+1)/2+1
constexpr long term(long n) {
    return ((n * (n + 1)) / 2) + 1;
}

int main() {
    for (long n = 1; n <= 15; ++n)
        std::cout << n << " -> " << term(n) << '\n';
    return 0;
}
