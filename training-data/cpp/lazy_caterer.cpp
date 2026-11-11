// Lazy caterer sequence: max pieces from n cuts
#include <iostream>

constexpr long term(long n) { return ((n * (n + 1))/2) + 1; }

int main() {
    for (long n = 0; n < 10; ++n) std::cout << term(n) << ' ';
    std::cout << '\n';
}
