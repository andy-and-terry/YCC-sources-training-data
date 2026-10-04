#include <algorithm>
#include <iostream>
#include <utility>

class Buffer {
    size_t n_;
    int *data_;
public:
    explicit Buffer(size_t n) : n_(n), data_(new int[n]()) { std::cout << "ctor\n"; }
    ~Buffer() { delete[] data_; }
    Buffer(const Buffer &o) : n_(o.n_), data_(new int[o.n_]) {
        std::copy(o.data_, o.data_ + n_, data_);
        std::cout << "copy ctor\n";
    }
    Buffer &operator=(const Buffer &o) {
        if (this != &o) { Buffer tmp(o); std::swap(n_, tmp.n_); std::swap(data_, tmp.data_); }
        return *this;
    }
    Buffer(Buffer &&o) noexcept : n_(std::exchange(o.n_, 0)), data_(std::exchange(o.data_, nullptr)) {
        std::cout << "move ctor\n";
    }
    Buffer &operator=(Buffer &&o) noexcept {
        std::swap(n_, o.n_); std::swap(data_, o.data_);
        return *this;
    }
    size_t size() const { return n_; }
};

int main() {
    Buffer a(4);
    Buffer b = a;
    Buffer c = std::move(a);
    std::cout << a.size() << " " << b.size() << " " << c.size() << "\n";
}
