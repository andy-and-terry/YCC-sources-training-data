#include <iostream>

bool is_prime(long n) {
    if (n < 2) return false;
    for (long i = 2; i * i <= n; ++i) if (n % i == 0) return false;
    return true;
}

int main() {
    int count = 0;
    for (long p = 2; count < 10; ++p) {
        if (is_prime(p) && is_prime(2 * p + 1)) { std::cout << p << ' '; ++count; }
    }
    std::cout << '\n';  // 2 3 5 11 23 29 41 53 83 89
}
