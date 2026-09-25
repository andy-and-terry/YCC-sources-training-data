#include <cstdint>
#include <iostream>
#include <string>

// Generic fast exponentiation over any monoid given an associative operation.
template <typename T, typename Op>
T power(T base, std::uint64_t exp, T identity, Op op) {
    T result = identity;
    while (exp) {
        if (exp & 1) result = op(result, base);
        base = op(base, base);
        exp >>= 1;
    }
    return result;
}

int main() {
    const std::uint64_t mod = 1'000'000'007;
    auto mulmod = [mod](std::uint64_t a, std::uint64_t b) { return a * b % mod; };
    std::cout << power<std::uint64_t>(7, 1'000'000'000'000'000'000ull, 1, mulmod) << '\n';
    std::cout << power<std::uint64_t>(3, 200, 1, [](auto a, auto b) { return a * b % 13; }) << '\n';
    // strings under concatenation form a monoid too
    std::cout << power<std::string>("ab", 5, "", [](const std::string& a, const std::string& b) { return a + b; }) << '\n';
}
