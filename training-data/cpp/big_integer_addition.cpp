#include <algorithm>
#include <cstdint>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

// Non-negative big integer in base 1e9 limbs (little-endian).
class BigUInt {
public:
    BigUInt(std::uint64_t v = 0) {
        do {
            limbs_.push_back(static_cast<std::uint32_t>(v % BASE));
            v /= BASE;
        } while (v);
    }

    explicit BigUInt(const std::string& s) {
        for (long end = static_cast<long>(s.size()); end > 0; end -= 9) {
            long start = std::max(0L, end - 9);
            limbs_.push_back(static_cast<std::uint32_t>(std::stoul(s.substr(static_cast<std::size_t>(start), static_cast<std::size_t>(end - start)))));
        }
    }

    friend BigUInt operator+(const BigUInt& a, const BigUInt& b) {
        BigUInt r;
        r.limbs_.clear();
        std::uint64_t carry = 0;
        for (std::size_t i = 0; i < std::max(a.limbs_.size(), b.limbs_.size()) || carry; ++i) {
            std::uint64_t s = carry + (i < a.limbs_.size() ? a.limbs_[i] : 0) + (i < b.limbs_.size() ? b.limbs_[i] : 0);
            r.limbs_.push_back(static_cast<std::uint32_t>(s % BASE));
            carry = s / BASE;
        }
        return r;
    }

    friend BigUInt operator*(const BigUInt& a, const BigUInt& b) {
        std::vector<std::uint64_t> tmp(a.limbs_.size() + b.limbs_.size(), 0);
        for (std::size_t i = 0; i < a.limbs_.size(); ++i) {
            std::uint64_t carry = 0;
            for (std::size_t j = 0; j < b.limbs_.size() || carry; ++j) {
                std::uint64_t cur = tmp[i + j] + carry + (j < b.limbs_.size() ? std::uint64_t{a.limbs_[i]} * b.limbs_[j] : 0);
                tmp[i + j] = cur % BASE;
                carry = cur / BASE;
            }
        }
        while (tmp.size() > 1 && tmp.back() == 0) tmp.pop_back();
        BigUInt r;
        r.limbs_.assign(tmp.begin(), tmp.end());
        return r;
    }

    friend std::ostream& operator<<(std::ostream& os, const BigUInt& v) {
        os << v.limbs_.back();
        for (auto it = v.limbs_.rbegin() + 1; it != v.limbs_.rend(); ++it) os << std::setw(9) << std::setfill('0') << *it;
        return os << std::setfill(' ');
    }

private:
    static constexpr std::uint64_t BASE = 1'000'000'000;
    std::vector<std::uint32_t> limbs_;
};

int main() {
    std::cout << BigUInt("99999999999999999999") + BigUInt(1) << '\n';
    BigUInt f(1);
    for (std::uint64_t i = 2; i <= 50; ++i) f = f * BigUInt(i);
    std::cout << "50! = " << f << '\n';
    BigUInt a(1), b(1);
    for (int i = 0; i < 200; ++i) {
        BigUInt c = a + b;
        a = b;
        b = c;
    }
    std::cout << "fib(201) = " << a << '\n';
}
