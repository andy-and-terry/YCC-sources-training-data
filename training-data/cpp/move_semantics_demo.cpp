#include <iostream>
#include <utility>
#include <vector>

class Buffer {
public:
    explicit Buffer(size_t size) : data(new int[size]), size(size) {
        std::cout << "constructed buffer of size " << size << std::endl;
    }

    Buffer(Buffer&& other) noexcept : data(other.data), size(other.size) {
        other.data = nullptr;
        other.size = 0;
        std::cout << "moved buffer" << std::endl;
    }

    Buffer& operator=(Buffer&& other) noexcept {
        if (this != &other) {
            delete[] data;
            data = other.data;
            size = other.size;
            other.data = nullptr;
            other.size = 0;
        }
        return *this;
    }

    Buffer(const Buffer&) = delete;
    Buffer& operator=(const Buffer&) = delete;

    ~Buffer() { delete[] data; }

    size_t getSize() const { return size; }

private:
    int* data;
    size_t size;
};

Buffer makeBuffer(size_t size) {
    return Buffer(size);
}

int main() {
    Buffer a = makeBuffer(10);
    Buffer b = std::move(a);
    std::cout << b.getSize() << std::endl;
    return 0;
}
