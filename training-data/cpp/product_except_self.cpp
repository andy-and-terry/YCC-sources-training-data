#include <iostream>
#include <vector>

std::vector<long long> product_except_self(const std::vector<int>& nums) {
    std::vector<long long> out(nums.size(), 1);
    long long prefix = 1, suffix = 1;
    for (std::size_t i = 0; i < nums.size(); ++i) out[i] = prefix, prefix *= nums[i];
    for (std::size_t i = nums.size(); i-- > 0;) out[i] *= suffix, suffix *= nums[i];
    return out;
}

int main() {
    for (const auto& v : {std::vector<int>{1, 2, 3, 4}, std::vector<int>{-1, 1, 0, -3, 3}}) {
        for (auto x : product_except_self(v)) std::cout << x << ' ';
        std::cout << '\n';
    }
}
