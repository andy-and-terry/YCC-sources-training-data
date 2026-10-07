#include <bitset>
#include <iostream>
#include <numeric>
#include <vector>

bool can_partition(const std::vector<int>& nums) {
    int total = std::accumulate(nums.begin(), nums.end(), 0);
    if (total % 2) return false;
    std::bitset<20001> reach;
    reach[0] = true;
    for (int x : nums) reach |= reach << static_cast<std::size_t>(x);
    return reach[static_cast<std::size_t>(total / 2)];
}

int main() {
    std::cout << std::boolalpha << can_partition({1, 5, 11, 5}) << ' ' << can_partition({1, 2, 3, 5}) << ' '
              << can_partition({100, 100, 100, 100, 100, 100, 100, 100, 99, 101}) << '\n';
}
