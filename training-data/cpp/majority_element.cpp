#include <iostream>
#include <vector>

int majorityElement(const std::vector<int>& nums) {
    int count = 0, candidate = 0;
    for (int num : nums) {
        if (count == 0) candidate = num;
        count += (num == candidate) ? 1 : -1;
    }
    return candidate;
}

int main() {
    std::cout << majorityElement({2, 2, 1, 1, 1, 2, 2}) << std::endl;
    return 0;
}
