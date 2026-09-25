#include <compare>
#include <cstdint>
#include <iostream>
#include <numeric>
#include <stdexcept>

class Fraction {
public:
    constexpr Fraction(std::int64_t n = 0, std::int64_t d = 1) : n_(n), d_(d) {
        if (d_ == 0) throw std::domain_error("zero denominator");
        if (d_ < 0) n_ = -n_, d_ = -d_;
        auto g = std::gcd(n_, d_);
        if (g > 1) n_ /= g, d_ /= g;
    }

    friend constexpr Fraction operator+(Fraction a, Fraction b) { return {a.n_ * b.d_ + b.n_ * a.d_, a.d_ * b.d_}; }
    friend constexpr Fraction operator-(Fraction a, Fraction b) { return {a.n_ * b.d_ - b.n_ * a.d_, a.d_ * b.d_}; }
    friend constexpr Fraction operator*(Fraction a, Fraction b) { return {a.n_ * b.n_, a.d_ * b.d_}; }
    friend constexpr Fraction operator/(Fraction a, Fraction b) { return {a.n_ * b.d_, a.d_ * b.n_}; }
    friend constexpr bool operator==(const Fraction&, const Fraction&) = default;
    friend constexpr std::strong_ordering operator<=>(const Fraction& a, const Fraction& b) {
        return a.n_ * b.d_ <=> b.n_ * a.d_;
    }

    friend std::ostream& operator<<(std::ostream& os, const Fraction& f) {
        os << f.n_;
        if (f.d_ != 1) os << '/' << f.d_;
        return os;
    }

private:
    std::int64_t n_, d_;
};

static_assert(Fraction(1, 3) + Fraction(1, 6) == Fraction(1, 2));

int main() {
    Fraction a{1, 3}, b{1, 6};
    std::cout << a + b << ' ' << a - b << ' ' << a * b << ' ' << a / b << ' ' << std::boolalpha << (a > b) << '\n';
    Fraction h;
    for (int k = 1; k <= 20; ++k) h = h + Fraction{1, k};
    std::cout << "H(20) = " << h << '\n';
}
