#include <iostream>
#include <numeric>

// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
long powMod(long b, long e, long m) {
    long r = 1;
    b %= m;
    for (; e > 0; e >>= 1) {
        if (e & 1) r = r * b % m;
        b = b * b % m;
    }
    return r;
}

bool isPrime(long n) {
    for (long p = 2; p * p <= n; ++p)
        if (n % p == 0) return false;
    return n > 1;
}

bool isCarmichael(long n) {
    if (isPrime(n)) return false;
    for (long a = 2; a < n; ++a)
        if (std::gcd(a, n) == 1 && powMod(a, n - 1, n) != 1) return false;
    return true;
}

int main() {
    for (long n = 3; n < 3000; n += 2)
        if (isCarmichael(n)) std::cout << n << ' ';
    std::cout << '\n';
}
