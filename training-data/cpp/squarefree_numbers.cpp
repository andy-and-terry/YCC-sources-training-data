// Squarefree numbers up to 100; expect 61.
#include <iostream>

bool squarefree(int n) {
    for (int d = 2; d * d <= n; ++d) if (n % (d * d) == 0) return false;
    return true;
}

int main() {
    int c = 0;
    for (int n = 1; n <= 100; ++n) c += squarefree(n);
    std::cout << c << '\n';
}
