#include <cmath>
#include <iostream>

bool isPronic(long x) {
    long n = static_cast<long>(std::sqrt(static_cast<double>(x)));
    return n * (n + 1) == x;
}

int main() {
    for (int n = 0; n < 10; ++n) std::cout << n * (n + 1) << ' ';
    std::cout << '\n'; // 0 2 6 12 20 30 42 56 72 90
    std::cout << std::boolalpha << isPronic(56) << ' ' << isPronic(57) << '\n';
}
