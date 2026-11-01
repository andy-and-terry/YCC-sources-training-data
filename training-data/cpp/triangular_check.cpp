#include <cmath>
#include <iostream>

// n is triangular iff 8n + 1 is a perfect square.
bool isTriangular(int n) {
    int s = 8 * n + 1;
    int r = static_cast<int>(std::sqrt(static_cast<double>(s)) + 0.5);
    return r * r == s;
}

int main() {
    for (int n = 0; n <= 20; ++n)
        if (isTriangular(n)) std::cout << n << ' ';
    std::cout << '\n';
}
