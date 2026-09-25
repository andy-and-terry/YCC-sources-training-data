#include <array>
#include <cstdint>
#include <iostream>

bool is_armstrong(std::uint64_t n) {
    std::array<int, 20> digits{};
    int k = 0;
    for (auto t = n; t; t /= 10) digits[k++] = static_cast<int>(t % 10);
    std::uint64_t sum = 0;
    for (int i = 0; i < k; ++i) {
        std::uint64_t p = 1;
        for (int e = 0; e < k; ++e) p *= static_cast<std::uint64_t>(digits[i]);
        sum += p;
    }
    return sum == n;
}

int main() {
    for (std::uint64_t n = 1; n < 10'000'000; ++n)
        if (is_armstrong(n)) std::cout << n << ' ';
    std::cout << '\n';
}
