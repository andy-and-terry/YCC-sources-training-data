#include <cstdint>
#include <iostream>
#include <unordered_map>
#include <vector>

class Collatz {
public:
    std::uint32_t steps(std::uint64_t n) {
        std::vector<std::uint64_t> path;
        while (n != 1) {
            if (auto it = cache_.find(n); it != cache_.end()) break;
            path.push_back(n);
            n = (n & 1) ? 3 * n + 1 : n / 2;
        }
        std::uint32_t s = n == 1 ? 0 : cache_[n];
        for (auto it = path.rbegin(); it != path.rend(); ++it) cache_[*it] = ++s;
        return s;
    }

private:
    std::unordered_map<std::uint64_t, std::uint32_t> cache_;
};

int main() {
    Collatz c;
    std::uint64_t best = 1;
    std::uint32_t best_steps = 0;
    for (std::uint64_t i = 1; i < 1'000'000; ++i) {
        auto s = c.steps(i);
        if (s > best_steps) best = i, best_steps = s;
    }
    std::cout << "27 takes " << c.steps(27) << " steps\n";
    std::cout << "longest under 1e6: " << best << " (" << best_steps << " steps)\n";
}
