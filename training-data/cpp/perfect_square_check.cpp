#include <cmath>
#include <iostream>

constexpr bool is_perfect_square(long long n) {
    if (n < 0) return false;
    long long r = static_cast<long long>(std::sqrt(static_cast<double>(n)));
    return r * r == n;
}

int main() {
    for (int n = 0; n < 30; ++n)
        if (is_perfect_square(n)) std::cout << n << ' ';
    std::cout << '\n';
}
