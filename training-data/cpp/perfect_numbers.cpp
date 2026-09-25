#include <cstdint>
#include <iostream>

enum class Kind { Perfect, Abundant, Deficient };

std::uint64_t aliquotSum(std::uint64_t n) {
    if (n == 1) return 0;
    std::uint64_t sum = 1;
    for (std::uint64_t i = 2; i * i <= n; ++i)
        if (n % i == 0) sum += i + (i != n / i ? n / i : 0);
    return sum;
}

Kind classify(std::uint64_t n) {
    auto s = aliquotSum(n);
    return s == n ? Kind::Perfect : s > n ? Kind::Abundant : Kind::Deficient;
}

const char* name(Kind k) {
    switch (k) {
        case Kind::Perfect: return "perfect";
        case Kind::Abundant: return "abundant";
        default: return "deficient";
    }
}

int main() {
    for (std::uint64_t n : {6, 12, 28, 13, 8128}) std::cout << n << ' ' << name(classify(n)) << '\n';
}
