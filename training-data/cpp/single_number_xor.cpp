#include <functional>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> nums{4, 1, 2, 1, 2};
    std::cout << std::accumulate(nums.begin(), nums.end(), 0, std::bit_xor<>()) << '\n';  // 4
}
