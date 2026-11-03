#include <iostream>
#include <numeric>
#include <vector>

class RangeSum {
    std::vector<long long> prefix_;

public:
    explicit RangeSum(const std::vector<int>& v) : prefix_(v.size() + 1, 0) {
        std::partial_sum(v.begin(), v.end(), prefix_.begin() + 1);
    }
    long long query(size_t lo, size_t hi) const { return prefix_[hi] - prefix_[lo]; }
};

int main() {
    RangeSum rs({3, 1, 4, 1, 5, 9, 2, 6});
    std::cout << rs.query(2, 5) << '\n';
}
