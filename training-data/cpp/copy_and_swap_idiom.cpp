#include <algorithm>
#include <cstddef>
#include <iostream>
#include <utility>

class IntBuffer {
    std::size_t n_;
    int* data_;
public:
    explicit IntBuffer(std::size_t n = 0) : n_(n), data_(n ? new int[n]() : nullptr) {}
    IntBuffer(const IntBuffer& o) : n_(o.n_), data_(n_ ? new int[n_] : nullptr) {
        std::copy(o.data_, o.data_ + n_, data_);
    }
    IntBuffer(IntBuffer&& o) noexcept : IntBuffer() { swap(*this, o); }
    IntBuffer& operator=(IntBuffer o) { swap(*this, o); return *this; }  // by value: copy or move
    ~IntBuffer() { delete[] data_; }
    friend void swap(IntBuffer& a, IntBuffer& b) noexcept {
        std::swap(a.n_, b.n_);
        std::swap(a.data_, b.data_);
    }
    int& operator[](std::size_t i) { return data_[i]; }
    std::size_t size() const { return n_; }
};

int main() {
    IntBuffer a(3);
    a[0] = 7; a[2] = 9;
    IntBuffer b;
    b = a;
    a[0] = 100;
    IntBuffer c = std::move(a);
    std::cout << b[0] << " " << b[2] << " " << c[0] << " " << a.size() << "\n";
}
