#include <cmath>
#include <cstdint>
#include <iostream>

constexpr std::uint64_t isqrt(std::uint64_t n) {
    if (n < 2) return n;
    std::uint64_t x = n, y = x / 2;
    while (y < x) {
        x = y;
        y = (x + n / x) / 2;
    }
    return x;
}

static_assert(isqrt(2) == 1 && isqrt(3) == 1 && isqrt(15) == 3 && isqrt(16) == 4 && isqrt(~0ull) == 4294967295ull);

// Integer k-th root via binary search.
std::uint64_t iroot(std::uint64_t n, int k) {
    std::uint64_t lo = 0, hi = static_cast<std::uint64_t>(std::pow(static_cast<double>(n), 1.0 / k)) + 2;
    auto pow_leq = [&](std::uint64_t b) {
        unsigned __int128 p = 1;
        for (int i = 0; i < k; ++i)
            if ((p *= b) > n) return false;
        return true;
    };
    while (lo < hi) {
        std::uint64_t mid = lo + (hi - lo + 1) / 2;
        if (pow_leq(mid)) lo = mid;
        else hi = mid - 1;
    }
    return lo;
}

int main() {
    for (std::uint64_t n : {0ull, 17ull, 1'000'000ull, 18446744073709551615ull}) std::cout << "isqrt(" << n << ") = " << isqrt(n) << '\n';
    std::cout << "cbrt(10^18) = " << iroot(1'000'000'000'000'000'000ull, 3) << ", 5th root of 2^60 = " << iroot(1ull << 60, 5) << '\n';
}
