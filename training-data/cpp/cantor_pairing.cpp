#include <cmath>
#include <iostream>
#include <utility>

// Cantor pairing function and its inverse.
long pairFn(long x, long y) { return (x + y) * (x + y + 1) / 2 + y; }

std::pair<long, long> unpair(long z) {
    long w = static_cast<long>((std::sqrt(8.0 * z + 1) - 1) / 2);
    long y = z - w * (w + 1) / 2;
    return {w - y, y};
}

int main() {
    std::cout << pairFn(3, 4) << '\n';
    auto [x, y] = unpair(32);
    std::cout << x << ' ' << y << '\n';
}
