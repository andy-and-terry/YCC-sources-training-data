#include <iostream>

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
int main() {
    unsigned long long r = 0;
    for (int i = 0; i < 8; ++i) {
        r = r * 10 + 1;
        std::cout << r << ' ';
    }
    std::cout << '\n';
}
