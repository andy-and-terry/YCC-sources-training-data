#include <algorithm>
#include <iostream>
#include <string>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; ++i)
        if (n % i == 0) return false;
    return true;
}

int reverse_digits(int n) {
    std::string s = std::to_string(n);
    std::reverse(s.begin(), s.end());
    return std::stoi(s);
}

int main() {
    for (int p = 2; p < 100; ++p)
        if (is_prime(p) && reverse_digits(p) != p && is_prime(reverse_digits(p)))
            std::cout << p << ' ';
    std::cout << '\n';
}
