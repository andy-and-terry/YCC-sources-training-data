#include <algorithm>
#include <iostream>
#include <utility>

class Buffer {
    size_t n_; int* d_;
public:
    explicit Buffer(size_t n) : n_(n), d_(new int[n]()) {}
    Buffer(const Buffer& o) : n_(o.n_), d_(new int[o.n_]) { std::copy(o.d_, o.d_ + n_, d_); }
    Buffer(Buffer&& o) noexcept : n_(std::exchange(o.n_, 0)), d_(std::exchange(o.d_, nullptr)) {}
    Buffer& operator=(Buffer o) noexcept { std::swap(n_, o.n_); std::swap(d_, o.d_); return *this; }
    ~Buffer() { delete[] d_; }
    size_t size() const { return n_; }
};

int main() {
    Buffer a(4), b = a, c = std::move(a);
    b = c;
    std::cout << a.size() << b.size() << c.size() << "\n";
}
