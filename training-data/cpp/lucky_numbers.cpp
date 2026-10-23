#include <iostream>
#include <vector>

std::vector<int> lucky(int limit) {
    std::vector<int> nums;
    for (int n = 1; n < limit; n += 2) nums.push_back(n);
    for (std::size_t i = 1; i < nums.size() && nums[i] <= static_cast<int>(nums.size()); ++i) {
        int step = nums[i];
        std::vector<int> kept;
        for (std::size_t idx = 0; idx < nums.size(); ++idx) {
            if ((idx + 1) % step != 0) kept.push_back(nums[idx]);
        }
        nums = kept;
    }
    return nums;
}

int main() {
    for (int v : lucky(100)) std::cout << v << ' ';
    std::cout << '\n';
}
