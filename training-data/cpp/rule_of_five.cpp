#include <algorithm>
#include <iostream>
#include <utility>

class Buffer {
public:
    explicit Buffer(std::size_t n) : size_(n), data_(new int[n]()) {}
    ~Buffer() { delete[] data_; }

    Buffer(const Buffer &other) : size_(other.size_), data_(new int[other.size_]) {
        std::copy(other.data_, other.data_ + size_, data_);
        std::cout << "copy" << std::endl;
    }
    Buffer &operator=(const Buffer &other) {
        if (this != &other) {
            Buffer tmp(other);
            std::swap(size_, tmp.size_);
            std::swap(data_, tmp.data_);
        }
        return *this;
    }
    Buffer(Buffer &&other) noexcept : size_(other.size_), data_(other.data_) {
        other.size_ = 0;
        other.data_ = nullptr;
        std::cout << "move" << std::endl;
    }
    Buffer &operator=(Buffer &&other) noexcept {
        std::swap(size_, other.size_);
        std::swap(data_, other.data_);
        return *this;
    }

    std::size_t size() const { return size_; }

private:
    std::size_t size_;
    int *data_;
};

int main() {
    Buffer a(10);
    Buffer b = a;
    Buffer c = std::move(a);
    std::cout << a.size() << " " << b.size() << " " << c.size() << std::endl;
    return 0;
}
