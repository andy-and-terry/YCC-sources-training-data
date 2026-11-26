// Sexy primes below 100; expect 16 pairs.
#include <iostream>
#include <string>
#include <vector>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d) if (n % d == 0) return false;
    return true;
}

int main() {
    int c = 0;
    for (int p = 2; p < 100; ++p) if (is_prime(p) && is_prime(p + 6)) ++c;
    std::cout << c << '\n';
}
