#include <iostream>

#include <map>

bool isSphenic(int n) {
    std::map<int, int> factors;
    for (int p = 2; p * p <= n; ++p)
        while (n % p == 0) {
            ++factors[p];
            n /= p;
        }
    if (n > 1) ++factors[n];
    if (factors.size() != 3) return false;
    for (const auto& [prime, exp] : factors)
        if (exp != 1) return false;
    return true;
}

int main() {
    for (int n = 2; n < 80; ++n)
        if (isSphenic(n)) std::cout << n << ' ';
    std::cout << '\n';
}
