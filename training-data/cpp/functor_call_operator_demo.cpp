#include <algorithm>
#include <iostream>
#include <vector>

class Accumulator {
    int total_ = 0;
public:
    int operator()(int x) { return total_ += x; }
    int total() const { return total_; }
};

struct InRange {
    int lo, hi;
    bool operator()(int x) const { return lo <= x && x <= hi; }
};

int main() {
    std::vector<int> v{5, 12, 7, 20, 15, 3};
    std::cout << std::count_if(v.begin(), v.end(), InRange{5, 15}) << " in range\n";

    Accumulator acc;
    Accumulator result = std::for_each(v.begin(), v.end(), acc);
    std::cout << "copy total=" << acc.total() << " returned total=" << result.total() << "\n";

    std::vector<int> prefix;
    Accumulator running;
    std::transform(v.begin(), v.end(), std::back_inserter(prefix), std::ref(running));
    for (int x : prefix) std::cout << x << ' ';
    std::cout << "\n";
}
