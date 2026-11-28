#include <iostream>
#include <numeric>

unsigned long rho(unsigned long n) {
    if (n % 2 == 0) return 2;
    unsigned long x = 2, y = 2, d = 1;
    auto f = [n](unsigned long v) { return (v * v + 1) % n; };
    while (d == 1) {
        x = f(x); y = f(f(y));
        d = std::gcd(x > y ? x - y : y - x, n);
    }
    return d;
}

int main() {
    unsigned long n = 8051, p = rho(n);
    std::cout << n << " = " << p << " * " << n / p << '\n';
}
