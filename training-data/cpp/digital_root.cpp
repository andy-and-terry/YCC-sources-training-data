#include <cstdint>
#include <iostream>

constexpr std::uint64_t digit_sum(std::uint64_t n) {
    std::uint64_t s = 0;
    for (; n; n /= 10) s += n % 10;
    return s;
}

constexpr std::uint64_t digital_root_iter(std::uint64_t n) {
    while (n >= 10) n = digit_sum(n);
    return n;
}

constexpr std::uint64_t digital_root(std::uint64_t n) { return n == 0 ? 0 : 1 + (n - 1) % 9; }

static_assert(digital_root(942) == 6 && digital_root_iter(942) == 6);

int main() {
    for (std::uint64_t n : {0ull, 16ull, 942ull, 132189ull, 493193ull, 18446744073709551615ull})
        std::cout << n << " -> " << digital_root(n) << (digital_root(n) == digital_root_iter(n) ? "" : " MISMATCH") << '\n';
}
