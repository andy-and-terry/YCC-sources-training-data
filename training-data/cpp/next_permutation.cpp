#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> nums = {1, 2, 3};
    std::next_permutation(nums.begin(), nums.end());
    for (int x : nums) std::cout << x << " ";
    std::cout << std::endl;

    std::vector<int> nums2 = {3, 2, 1};
    bool wrapped = !std::next_permutation(nums2.begin(), nums2.end());
    for (int x : nums2) std::cout << x << " ";
    std::cout << "(wrapped: " << wrapped << ")" << std::endl;
    return 0;
}
