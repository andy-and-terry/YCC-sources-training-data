#include <cmath>
#include <iostream>

// Leyland numbers: x^y + y^x for x >= y >= 2.
long leyland(int x, int y) {
    return std::lround(std::pow(x, y) + std::pow(y, x));
}

int main() {
    for (int x = 2; x <= 4; ++x)
        for (int y = 2; y <= x; ++y)
            std::cout << leyland(x, y) << ' ';
    std::cout << '\n';
}
