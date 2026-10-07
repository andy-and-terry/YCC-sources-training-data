#include <algorithm>
#include <cstddef>
#include <iostream>
#include <iterator>
#include <numeric>
#include <type_traits>
#include <vector>

// A forward iterator over an arithmetic progression, usable with <algorithm>.
class StepRange {
public:
    class iterator {
    public:
        using iterator_category = std::forward_iterator_tag;
        using value_type = int;
        using difference_type = std::ptrdiff_t;
        using pointer = const int*;
        using reference = int;

        iterator(int value, int step) : value_(value), step_(step) {}
        reference operator*() const { return value_; }
        iterator& operator++() { value_ += step_; return *this; }
        iterator operator++(int) { iterator tmp = *this; ++(*this); return tmp; }
        bool operator==(const iterator& o) const { return value_ == o.value_; }
        bool operator!=(const iterator& o) const { return !(*this == o); }

    private:
        int value_;
        int step_;
    };

    StepRange(int first, int last, int step) : first_(first), step_(step) {
        int count = (last - first + step - 1) / step;
        last_ = first + count * step;
    }
    iterator begin() const { return {first_, step_}; }
    iterator end() const { return {last_, step_}; }

private:
    int first_, last_, step_;
};

int main() {
    StepRange r(0, 20, 5);
    for (int v : r) std::cout << v << ' ';
    std::cout << std::endl;

    std::cout << "sum: " << std::accumulate(r.begin(), r.end(), 0) << std::endl;
    std::cout << "count: " << std::distance(r.begin(), r.end()) << std::endl;
    std::cout << "has 10: " << (std::find(r.begin(), r.end(), 10) != r.end()) << std::endl;

    std::vector<int> copy(r.begin(), r.end());
    std::cout << "copied: " << copy.size() << " elements" << std::endl;

    using traits = std::iterator_traits<StepRange::iterator>;
    static_assert(std::is_same_v<traits::value_type, int>);
    return 0;
}
