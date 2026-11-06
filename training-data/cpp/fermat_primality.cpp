// Fermat primality test; Carmichael number 561 fools it.
#include <iostream>

unsigned long long powmod(unsigned long long b, unsigned long long e, unsigned long long m) {
    unsigned long long r = 1;
    b %= m;
    for (; e; e >>= 1, b = b * b % m)
        if (e & 1) r = r * b % m;
    return r;
}

bool fermat_probably_prime(unsigned long long n) {
    return n > 2 && powmod(2, n - 1, n) == 1;
}

int main() {
    for (auto n : {97ULL, 91ULL, 561ULL})
        std::cout << n << ' ' << std::boolalpha << fermat_probably_prime(n) << '\n';
}
