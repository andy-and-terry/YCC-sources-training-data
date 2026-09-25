#include <iostream>
#include <vector>

class Poly {
public:
    Poly(std::initializer_list<long long> c) : c_(c) { trim(); }
    explicit Poly(std::vector<long long> c) : c_(std::move(c)) { trim(); }

    Poly operator+(const Poly& o) const {
        std::vector<long long> r(std::max(c_.size(), o.c_.size()), 0);
        for (std::size_t i = 0; i < c_.size(); ++i) r[i] += c_[i];
        for (std::size_t i = 0; i < o.c_.size(); ++i) r[i] += o.c_[i];
        return Poly(r);
    }

    Poly operator*(const Poly& o) const {
        std::vector<long long> r(c_.size() + o.c_.size() - 1, 0);
        for (std::size_t i = 0; i < c_.size(); ++i)
            for (std::size_t j = 0; j < o.c_.size(); ++j) r[i + j] += c_[i] * o.c_[j];
        return Poly(r);
    }

    long long operator()(long long x) const {
        long long acc = 0;
        for (auto it = c_.rbegin(); it != c_.rend(); ++it) acc = acc * x + *it;
        return acc;
    }

    Poly compose(const Poly& inner) const {  // this(inner(x)) via Horner
        Poly acc{0};
        for (auto it = c_.rbegin(); it != c_.rend(); ++it) acc = acc * inner + Poly{*it};
        return acc;
    }

    friend std::ostream& operator<<(std::ostream& os, const Poly& p) {
        bool first = true;
        for (std::size_t i = p.c_.size(); i-- > 0;) {
            long long c = p.c_[i];
            if (!c && p.c_.size() > 1) continue;
            os << (first ? (c < 0 ? "-" : "") : (c < 0 ? " - " : " + "));
            long long a = c < 0 ? -c : c;
            if (a != 1 || i == 0) os << a;
            if (i) os << 'x';
            if (i > 1) os << '^' << i;
            first = false;
        }
        return os;
    }

private:
    void trim() {
        while (c_.size() > 1 && c_.back() == 0) c_.pop_back();
        if (c_.empty()) c_.push_back(0);
    }
    std::vector<long long> c_;
};

int main() {
    Poly p{1, 1}, q{-1, 0, 1};
    std::cout << p * p * p << '\n' << q.compose(p) << '\n' << (p + q)(3) << '\n';
}
