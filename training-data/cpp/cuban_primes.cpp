#include <iostream>
#include <vector>

bool is_prime(long n) {
    if (n < 2) return false;
    for (long i = 2; i * i <= n; ++i)
        if (n % i == 0) return false;
    return true;
}

int main() {
    std::vector<long> out;
    for (long y = 1; out.size() < 8; ++y) {
        long p = 3 * y * y + 3 * y + 1;
        if (is_prime(p)) out.push_back(p);
    }
    for (long p : out) std::cout << p << ' ';
    std::cout << '\n';
}
