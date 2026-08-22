#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> nums = {3, 2, 1, 5, 6, 4};
    int k = 2;
    std::nth_element(nums.begin(), nums.begin() + k - 1, nums.end(), std::greater<int>());
    std::cout << nums[k - 1] << std::endl;
    return 0;
}
