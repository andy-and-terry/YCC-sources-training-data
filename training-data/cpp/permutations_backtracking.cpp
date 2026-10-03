#include <iostream>
#include <vector>

void permute(std::vector<int>& nums, int start, std::vector<std::vector<int>>& result) {
    if (start == static_cast<int>(nums.size())) {
        result.push_back(nums);
        return;
    }
    for (int i = start; i < static_cast<int>(nums.size()); i++) {
        std::swap(nums[start], nums[i]);
        permute(nums, start + 1, result);
        std::swap(nums[start], nums[i]);
    }
}

int main() {
    std::vector<int> nums = {1, 2, 3};
    std::vector<std::vector<int>> result;
    permute(nums, 0, result);

    for (const auto& perm : result) {
        for (int v : perm) std::cout << v << " ";
        std::cout << std::endl;
    }
    return 0;
}
