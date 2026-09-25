#include <cstdint>
#include <iostream>
#include <map>
#include <numeric>
#include <random>

using u64 = std::uint64_t;
using u128 = unsigned __int128;

u64 mul_mod(u64 a, u64 b, u64 m) { return static_cast<u64>(static_cast<u128>(a) * b % m); }

u64 pow_mod(u64 b, u64 e, u64 m) {
    u64 r = 1;
    for (b %= m; e; e >>= 1, b = mul_mod(b, b, m))
        if (e & 1) r = mul_mod(r, b, m);
    return r;
}

bool is_prime(u64 n) {
    if (n < 2) return false;
    for (u64 p : {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37})
        if (n % p == 0) return n == p;
    u64 d = n - 1;
    int s = 0;
    while (!(d & 1)) d >>= 1, ++s;
    for (u64 a : {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37}) {
        u64 x = pow_mod(a, d, n);
        if (x == 1 || x == n - 1) continue;
        bool comp = true;
        for (int i = 1; i < s && comp; ++i)
            if ((x = mul_mod(x, x, n)) == n - 1) comp = false;
        if (comp) return false;
    }
    return true;
}

// Pollard's rho with Floyd cycle detection.
u64 rho(u64 n) {
    if (n % 2 == 0) return 2;
    static std::mt19937_64 rng(1234);
    for (;;) {
        u64 c = rng() % (n - 1) + 1, x = rng() % n, y = x, d = 1;
        auto f = [&](u64 v) { return (mul_mod(v, v, n) + c) % n; };
        while (d == 1) {
            x = f(x);
            y = f(f(y));
            d = std::gcd(x > y ? x - y : y - x, n);
        }
        if (d != n) return d;
    }
}

void factor(u64 n, std::map<u64, int>& out) {
    if (n == 1) return;
    if (is_prime(n)) {
        ++out[n];
        return;
    }
    u64 d = rho(n);
    factor(d, out);
    factor(n / d, out);
}

int main() {
    for (u64 n : {360ull, 97ull, 600851475143ull, 1000000016000000063ull, 18446744073709551615ull}) {
        std::map<u64, int> f;
        factor(n, f);
        std::cout << n << " =";
        bool first = true;
        for (auto [p, e] : f) {
            std::cout << (first ? " " : " * ") << p;
            if (e > 1) std::cout << '^' << e;
            first = false;
        }
        std::cout << '\n';
    }
}
