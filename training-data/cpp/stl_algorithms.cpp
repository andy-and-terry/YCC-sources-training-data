#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> nums = {5, 3, 8, 1, 9, 2, 7};

    std::sort(nums.begin(), nums.end());
    for (int x : nums) std::cout << x << " ";
    std::cout << std::endl;

    int sum = std::accumulate(nums.begin(), nums.end(), 0);
    std::cout << "sum: " << sum << std::endl;

    auto it = std::find(nums.begin(), nums.end(), 8);
    std::cout << "found 8 at index: " << std::distance(nums.begin(), it) << std::endl;

    int evenCount = static_cast<int>(std::count_if(nums.begin(), nums.end(), [](int n) { return n % 2 == 0; }));
    std::cout << "even count: " << evenCount << std::endl;

    std::vector<int> transformed;
    std::transform(nums.begin(), nums.end(), std::back_inserter(transformed), [](int n) { return n * n; });
    for (int x : transformed) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
