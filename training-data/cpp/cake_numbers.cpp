#include <iostream>

// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
int main() {
    for (int n = 0; n < 10; ++n) std::cout << (n * n * n + 5 * n + 6) / 6 << ' ';
    std::cout << '\n';
}
