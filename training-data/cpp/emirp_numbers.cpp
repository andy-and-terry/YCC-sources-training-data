#include <iostream>
#include <string>
#include <algorithm>

// Emirps: primes whose digit reversal is a different prime.
bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d)
        if (n % d == 0) return false;
    return true;
}

int main() {
    for (int n = 2; n < 200; ++n) {
        std::string s = std::to_string(n);
        std::reverse(s.begin(), s.end());
        int r = std::stoi(s);
        if (r != n && isPrime(n) && isPrime(r)) std::cout << n << ' ';
    }
    std::cout << '\n';
}
