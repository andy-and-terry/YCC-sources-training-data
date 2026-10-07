#include <cstdint>
#include <iostream>
#include <numeric>
#include <vector>

std::uint64_t phi(std::uint64_t n) {
    std::uint64_t result = n;
    for (std::uint64_t p = 2; p * p <= n; ++p) {
        if (n % p) continue;
        while (n % p == 0) n /= p;
        result -= result / p;
    }
    if (n > 1) result -= result / n;
    return result;
}

std::vector<std::uint32_t> phi_sieve(std::uint32_t limit) {
    std::vector<std::uint32_t> t(limit + 1);
    std::iota(t.begin(), t.end(), 0u);
    for (std::uint32_t i = 2; i <= limit; ++i)
        if (t[i] == i)
            for (std::uint32_t j = i; j <= limit; j += i) t[j] -= t[j] / i;
    return t;
}

int main() {
    auto t = phi_sieve(1'000'000);
    for (int i = 1; i <= 20; ++i) std::cout << t[i] << ' ';
    std::uint64_t sum = std::accumulate(t.begin() + 2, t.end(), std::uint64_t{0});
    std::cout << "\nsum phi(2..1e6) = " << sum << ", phi(10^12) = " << phi(1'000'000'000'000ull) << '\n';
}
