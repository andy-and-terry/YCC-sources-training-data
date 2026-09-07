#include <cstdint>
#include <iostream>
#include <vector>

uint64_t powMod(uint64_t base, uint64_t exp, uint64_t mod) {
    uint64_t result = 1;
    base %= mod;
    while (exp > 0) {
        if (exp & 1) result = (__uint128_t)result * base % mod;
        base = (__uint128_t)base * base % mod;
        exp >>= 1;
    }
    return result;
}

bool millerRabin(uint64_t n, uint64_t a, uint64_t d, int r) {
    uint64_t x = powMod(a, d, n);
    if (x == 1 || x == n - 1) return true;
    for (int i = 0; i < r - 1; i++) {
        x = (__uint128_t)x * x % n;
        if (x == n - 1) return true;
    }
    return false;
}

bool isPrime(uint64_t n) {
    if (n < 2) return false;
    for (uint64_t p : {2, 3, 5, 7, 11, 13, 17, 19, 23}) {
        if (n == p) return true;
        if (n % p == 0) return false;
    }
    uint64_t d = n - 1;
    int r = 0;
    while (d % 2 == 0) {
        d /= 2;
        r++;
    }
    for (uint64_t a : {2, 3, 5, 7, 11, 13, 17, 19, 23}) {
        if (!millerRabin(n, a, d, r)) return false;
    }
    return true;
}

int main() {
    std::vector<uint64_t> candidates = {97, 561, 7919, 1000000007ULL, 1000000008ULL};
    for (uint64_t n : candidates) std::cout << n << ": " << (isPrime(n) ? "prime" : "composite") << std::endl;
    return 0;
}
