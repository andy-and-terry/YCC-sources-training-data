// Circular primes below 100; expect 13.
#include <iostream>
#include <string>
#include <vector>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d) if (n % d == 0) return false;
    return true;
}

bool circular(int n) {
    std::string s = std::to_string(n);
    for (std::size_t i = 0; i < s.size(); ++i)
        if (!is_prime(std::stoi(s.substr(i) + s.substr(0, i)))) return false;
    return true;
}

int main() {
    int c = 0;
    for (int n = 2; n < 100; ++n) if (circular(n)) ++c;
    std::cout << c << '\n';
}
