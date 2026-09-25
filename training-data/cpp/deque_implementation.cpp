#include <iostream>
#include <memory>
#include <stdexcept>

template <typename T>
class RingDeque {
public:
    std::size_t size() const { return size_; }
    bool empty() const { return size_ == 0; }

    void push_back(T x) {
        grow_if_full();
        buf_[(head_ + size_++) % cap_] = std::move(x);
    }
    void push_front(T x) {
        grow_if_full();
        head_ = (head_ + cap_ - 1) % cap_;
        buf_[head_] = std::move(x);
        ++size_;
    }
    T pop_front() {
        check();
        T x = std::move(buf_[head_]);
        head_ = (head_ + 1) % cap_;
        --size_;
        return x;
    }
    T pop_back() {
        check();
        return std::move(buf_[(head_ + --size_) % cap_]);
    }
    T& operator[](std::size_t i) { return buf_[(head_ + i) % cap_]; }

private:
    void check() const {
        if (empty()) throw std::out_of_range("empty deque");
    }
    void grow_if_full() {
        if (size_ < cap_) return;
        std::size_t ncap = cap_ ? cap_ * 2 : 4;
        auto nb = std::make_unique<T[]>(ncap);
        for (std::size_t i = 0; i < size_; ++i) nb[i] = std::move(buf_[(head_ + i) % cap_]);
        buf_ = std::move(nb);
        cap_ = ncap;
        head_ = 0;
    }

    std::unique_ptr<T[]> buf_;
    std::size_t cap_ = 0, head_ = 0, size_ = 0;
};

int main() {
    RingDeque<std::string> d;
    for (auto w : {"c", "d", "e"}) d.push_back(w);
    for (auto w : {"b", "a"}) d.push_front(w);
    for (std::size_t i = 0; i < d.size(); ++i) std::cout << d[i];
    auto f = d.pop_front();
    auto b = d.pop_back();
    std::cout << ' ' << f << ' ' << b << ' ' << d.size() << '\n';
}
