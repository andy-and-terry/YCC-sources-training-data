// Count contiguous subarrays whose sum equals k (prefix sums + hash map).
#include <iostream>
#include <unordered_map>
#include <vector>

int count_subarrays(const std::vector<int>& nums, int k) {
    std::unordered_map<int, int> seen{{0, 1}};
    int total = 0, count = 0;
    for (int x : nums) {
        total += x;
        if (auto it = seen.find(total - k); it != seen.end()) count += it->second;
        ++seen[total];
    }
    return count;
}

int main() { std::cout << count_subarrays({1, 1, 1}, 2) << '\n'; }
