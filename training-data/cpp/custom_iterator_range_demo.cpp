#include <iostream>
#include <iterator>

// A minimal forward iterator over [start, stop) so IntRange can be
// used directly in a range-based for loop.
class IntRange {
public:
    IntRange(int start, int stop) : start_(start), stop_(stop) {}

    class Iterator {
    public:
        explicit Iterator(int value) : value_(value) {}
        int operator*() const { return value_; }
        Iterator& operator++() { ++value_; return *this; }
        bool operator!=(const Iterator& other) const { return value_ != other.value_; }
    private:
        int value_;
    };

    Iterator begin() const { return Iterator(start_); }
    Iterator end() const { return Iterator(stop_); }

private:
    int start_, stop_;
};

int main() {
    for (int i : IntRange(1, 6)) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    return 0;
}
