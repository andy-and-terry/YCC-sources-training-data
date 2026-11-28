#include <iostream>

constexpr bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d)
        if (n % d == 0) return false;
    return true;
}

int main() {
    int n = 28;
    for (int p = 2; p <= n / 2; ++p)
        if (isPrime(p) && isPrime(n - p)) std::cout << p << " + " << n - p << "\n";
}
