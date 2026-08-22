#include <iostream>
#include <vector>

template <typename T>
class CircularBuffer {
public:
    explicit CircularBuffer(size_t capacity) : buffer(capacity), capacity(capacity) {}

    void append(T item) {
        size_t tail = (head + size) % capacity;
        buffer[tail] = item;
        if (size < capacity) size++;
        else head = (head + 1) % capacity;
    }

    std::vector<T> toVector() const {
        std::vector<T> result;
        for (size_t i = 0; i < size; i++) result.push_back(buffer[(head + i) % capacity]);
        return result;
    }

private:
    std::vector<T> buffer;
    size_t capacity, head = 0, size = 0;
};

int main() {
    CircularBuffer<int> cb(3);
    for (int i = 0; i < 5; i++) cb.append(i);
    for (int x : cb.toVector()) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
