// Emirps below 200; expect 15.
#include <iostream>
#include <string>
#include <vector>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d) if (n % d == 0) return false;
    return true;
}

int rev(int n) {
    std::string s = std::to_string(n);
    return std::stoi(std::string(s.rbegin(), s.rend()));
}

int main() {
    int c = 0;
    for (int n = 2; n < 200; ++n) if (is_prime(n) && rev(n) != n && is_prime(rev(n))) ++c;
    std::cout << c << '\n';
}
