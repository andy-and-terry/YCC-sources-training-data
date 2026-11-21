#include <iostream>
#include <numeric>

// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
int phi(int n) {
    int c = 0;
    for (int k = 1; k <= n; ++k)
        if (std::gcd(k, n) == 1) ++c;
    return c;
}

bool isPerfectTotient(int n) {
    int total = 0;
    for (int m = n; m > 1;) {
        m = phi(m);
        total += m;
    }
    return total == n;
}

int main() {
    for (int n = 2; n < 200; ++n)
        if (isPerfectTotient(n)) std::cout << n << ' ';
    std::cout << '\n';
}
