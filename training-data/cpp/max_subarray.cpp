#include <algorithm>
#include <iostream>
#include <vector>

int maxSubarray(const std::vector<int>& nums) {
    int best = nums[0], current = nums[0];
    for (size_t i = 1; i < nums.size(); i++) {
        current = std::max(nums[i], current + nums[i]);
        best = std::max(best, current);
    }
    return best;
}

int main() {
    std::cout << maxSubarray({-2, 1, -3, 4, -1, 2, 1, -5, 4}) << std::endl;
    return 0;
}
