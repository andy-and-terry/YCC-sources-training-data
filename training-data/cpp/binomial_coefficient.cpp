#include <cstdint>
#include <iostream>
#include <vector>

class Binomial {
public:
    Binomial(std::size_t n, std::uint64_t mod) : mod_(mod), fact_(n + 1), inv_(n + 1) {
        fact_[0] = 1;
        for (std::size_t i = 1; i <= n; ++i) fact_[i] = fact_[i - 1] * i % mod_;
        inv_[n] = pow(fact_[n], mod_ - 2);
        for (std::size_t i = n; i > 0; --i) inv_[i - 1] = inv_[i] * i % mod_;
    }

    std::uint64_t operator()(std::size_t n, std::size_t k) const {
        if (k > n) return 0;
        return fact_[n] * inv_[k] % mod_ * inv_[n - k] % mod_;
    }

private:
    std::uint64_t pow(std::uint64_t b, std::uint64_t e) const {
        std::uint64_t r = 1;
        for (b %= mod_; e; e >>= 1, b = b * b % mod_)
            if (e & 1) r = r * b % mod_;
        return r;
    }

    std::uint64_t mod_;
    std::vector<std::uint64_t> fact_, inv_;
};

constexpr std::uint64_t choose_exact(std::uint64_t n, std::uint64_t k) {
    if (k > n) return 0;
    if (k > n - k) k = n - k;
    std::uint64_t r = 1;
    for (std::uint64_t i = 1; i <= k; ++i) r = r * (n - k + i) / i;
    return r;
}

static_assert(choose_exact(52, 5) == 2598960);

int main() {
    Binomial c(1'000'000, 1'000'000'007);
    std::cout << choose_exact(10, 3) << ' ' << choose_exact(60, 30) << '\n';
    std::cout << c(1000, 500) << ' ' << c(1'000'000, 123'456) << '\n';
}
