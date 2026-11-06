// Emirps: primes whose digit reversal is a different prime.
#include <algorithm>
#include <iostream>
#include <string>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; ++i)
        if (n % i == 0) return false;
    return true;
}

int main() {
    for (int n = 2; n < 100; ++n) {
        std::string s = std::to_string(n);
        std::reverse(s.begin(), s.end());
        int r = std::stoi(s);
        if (r != n && is_prime(n) && is_prime(r)) std::cout << n << ' ';
    }
    std::cout << '\n';
}
