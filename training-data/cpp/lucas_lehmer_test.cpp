#include <iostream>

static bool isPrime(int n) {
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return n > 1;
}

static bool lucasLehmer(int p) {
    if (p == 2) return true;
    unsigned long long m = (1ULL << p) - 1;
    unsigned long long s = 4;
    for (int i = 0; i < p - 2; i++) s = (s * s + m - 2) % m;
    return s == 0;
}

int main() {
    bool first = true;
    for (int p = 2; p <= 19; p++) {
        if (isPrime(p) && lucasLehmer(p)) {
            std::cout << (first ? "" : " ") << p;
            first = false;
        }
    }
    std::cout << "\n";
    return 0;
}
