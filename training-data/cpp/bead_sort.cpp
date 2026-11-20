#include <algorithm>
#include <iostream>
#include <vector>
// Bead (gravity) sort.
std::vector<int> beadSort(const std::vector<int>& nums) {
    std::vector<int> cols(*std::max_element(nums.begin(), nums.end()), 0), out;
    for (int n : nums) for (int i = 0; i < n; i++) cols[i]++;
    for (size_t r = 0; r < nums.size(); r++)
        out.insert(out.begin(), std::count_if(cols.begin(), cols.end(), [r](int c) { return c > (int)r; }));
    return out;
}
int main() { for (int v : beadSort({5, 3, 1, 4, 2})) std::cout << v << ' '; std::cout << '\n'; }
