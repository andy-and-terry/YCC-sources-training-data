#include <iostream>

class FibonacciGenerator {
public:
    explicit FibonacciGenerator(int count) : remaining(count) {}

    struct Iterator {
        long long a = 0;
        long long b = 1;
        int remaining;

        long long operator*() const { return a; }

        Iterator &operator++() {
            long long next = a + b;
            a = b;
            b = next;
            remaining--;
            return *this;
        }

        bool operator!=(const Iterator &other) const { return remaining != other.remaining; }
    };

    Iterator begin() const { return Iterator{0, 1, remaining}; }
    Iterator end() const { return Iterator{0, 1, 0}; }

private:
    int remaining;
};

int main() {
    for (long long value : FibonacciGenerator(10)) {
        std::cout << value << " ";
    }
    std::cout << std::endl;

    FibonacciGenerator gen(5);
    auto it = gen.begin();
    long long sum = 0;
    while (it != gen.end()) {
        sum += *it;
        ++it;
    }
    std::cout << "sum: " << sum << std::endl;

    return 0;
}
