// Deficient numbers below 100; expect 76.
#include <iostream>

int proper_sum(int n) {
    int t = 0;
    for (int d = 1; d < n; ++d) if (n % d == 0) t += d;
    return t;
}

int main() {
    int c = 0;
    for (int n = 1; n < 100; ++n) if (proper_sum(n) < n) ++c;
    std::cout << c << '\n';
}
