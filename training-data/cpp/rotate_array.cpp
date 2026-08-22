#include <iostream>
#include <vector>

std::vector<int> rotate(const std::vector<int>& nums, int k) {
    int n = static_cast<int>(nums.size());
    k = ((k % n) + n) % n;
    std::vector<int> result(n);
    for (int i = 0; i < n; i++) result[(i + k) % n] = nums[i];
    return result;
}

int main() {
    for (int x : rotate({1, 2, 3, 4, 5, 6, 7}, 3)) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
