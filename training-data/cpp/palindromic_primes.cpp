// Palindromic primes below 200; expect 10.
#include <algorithm>
#include <iostream>
#include <string>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d) if (n % d == 0) return false;
    return true;
}

bool is_palindrome(int n) {
    std::string s = std::to_string(n);
    return std::equal(s.begin(), s.begin() + s.size() / 2, s.rbegin());
}

int main() {
    int c = 0;
    for (int n = 2; n < 200; ++n) {
        if (is_palindrome(n) && is_prime(n)) { std::cout << n << ' '; ++c; }
    }
    std::cout << '\n' << c << '\n';
}
