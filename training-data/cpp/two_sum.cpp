#include <iostream>
#include <unordered_map>
#include <vector>

std::pair<int, int> twoSum(const std::vector<int>& nums, int target) {
    std::unordered_map<int, int> seen;
    for (size_t i = 0; i < nums.size(); i++) {
        auto it = seen.find(target - nums[i]);
        if (it != seen.end()) return {it->second, static_cast<int>(i)};
        seen[nums[i]] = static_cast<int>(i);
    }
    return {-1, -1};
}

int main() {
    auto [a, b] = twoSum({2, 7, 11, 15}, 9);
    std::cout << a << " " << b << std::endl;
    return 0;
}
