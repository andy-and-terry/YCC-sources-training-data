#include <iostream>
#include <queue>
#include <vector>

int kthLargest(const std::vector<int>& nums, int k) {
    std::priority_queue<int, std::vector<int>, std::greater<int>> heap;
    for (int num : nums) {
        heap.push(num);
        if (static_cast<int>(heap.size()) > k) heap.pop();
    }
    return heap.top();
}

int main() {
    std::cout << kthLargest({3, 2, 1, 5, 6, 4}, 2) << std::endl;
    return 0;
}
