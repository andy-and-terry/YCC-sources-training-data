#include <algorithm>
#include <iostream>
#include <vector>

int lengthOfLIS(const std::vector<int>& nums) {
    std::vector<int> tails;
    for (int num : nums) {
        auto it = std::lower_bound(tails.begin(), tails.end(), num);
        if (it == tails.end()) tails.push_back(num);
        else *it = num;
    }
    return static_cast<int>(tails.size());
}

int main() {
    std::cout << lengthOfLIS({10, 9, 2, 5, 3, 7, 101, 18}) << std::endl;
    return 0;
}
