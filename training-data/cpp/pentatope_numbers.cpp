#include <iostream>

// n(n+1)(n+2)(n+3)/24
constexpr long term(long n) {
    return (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24;
}

int main() {
    for (long n = 1; n <= 15; ++n)
        std::cout << n << " -> " << term(n) << '\n';
    return 0;
}
