#include <iostream>

// Sophie Germain primes: p prime and 2p + 1 prime.
bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d)
        if (n % d == 0) return false;
    return true;
}

int main() {
    for (int p = 2; p < 100; ++p)
        if (isPrime(p) && isPrime(2 * p + 1)) std::cout << p << ' ';
    std::cout << '\n';
}
