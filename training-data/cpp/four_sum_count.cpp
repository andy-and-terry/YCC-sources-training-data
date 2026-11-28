#include <iostream>
#include <unordered_map>
#include <vector>

int fourSumCount(const std::vector<int>& a, const std::vector<int>& b,
                 const std::vector<int>& c, const std::vector<int>& d) {
    std::unordered_map<int, int> sums;
    for (int x : a)
        for (int y : b) ++sums[x + y];
    int count = 0;
    for (int x : c)
        for (int y : d) {
            auto it = sums.find(-(x + y));
            if (it != sums.end()) count += it->second;
        }
    return count;
}

int main() {
    std::cout << fourSumCount({1, 2}, {-2, -1}, {-1, 2}, {0, 2}) << '\n';  // 2
}
