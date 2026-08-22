#include <deque>
#include <iostream>
#include <vector>

std::vector<int> maxSlidingWindow(const std::vector<int>& nums, int k) {
    std::deque<int> dq;
    std::vector<int> result;
    for (size_t i = 0; i < nums.size(); i++) {
        while (!dq.empty() && nums[dq.back()] <= nums[i]) dq.pop_back();
        dq.push_back(static_cast<int>(i));
        if (dq.front() <= static_cast<int>(i) - k) dq.pop_front();
        if (static_cast<int>(i) >= k - 1) result.push_back(nums[dq.front()]);
    }
    return result;
}

int main() {
    for (int x : maxSlidingWindow({1, 3, -1, -3, 5, 3, 6, 7}, 3)) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
