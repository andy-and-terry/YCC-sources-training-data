#include <cstdint>
#include <iostream>
#include <map>
#include <vector>

class StairCounter {
public:
    explicit StairCounter(std::vector<int> steps) : steps_(std::move(steps)) {}

    std::uint64_t ways(int n) {
        if (n < 0) return 0;
        if (n == 0) return 1;
        if (auto it = memo_.find(n); it != memo_.end()) return it->second;
        std::uint64_t total = 0;
        for (int s : steps_) total += ways(n - s);
        return memo_[n] = total;
    }

private:
    std::vector<int> steps_;
    std::map<int, std::uint64_t> memo_;
};

int main() {
    StairCounter two({1, 2}), odd({1, 3, 5});
    for (int n = 1; n <= 10; ++n) std::cout << two.ways(n) << ' ';
    std::cout << '\n' << two.ways(90) << ' ' << odd.ways(10) << '\n';
}
