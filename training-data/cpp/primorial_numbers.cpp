// Primorials up to 1e6, including 1; expect 8.
#include <iostream>
#include <string>
#include <vector>

bool is_prime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; ++d) if (n % d == 0) return false;
    return true;
}

int main() {
    std::vector<long> v{1};
    long acc = 1;
    for (int p = 2;; ++p) {
        if (!is_prime(p)) continue;
        acc *= p;
        if (acc > 1000000) break;
        v.push_back(acc);
    }
    for (long x : v) std::cout << x << ' ';
    std::cout << '\n' << v.size() << '\n';
}
