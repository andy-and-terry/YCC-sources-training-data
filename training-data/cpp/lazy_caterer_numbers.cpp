#include <iostream>

// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
int main() {
    for (int n = 0; n < 10; ++n) std::cout << n * (n + 1) / 2 + 1 << ' ';
    std::cout << '\n';
}
