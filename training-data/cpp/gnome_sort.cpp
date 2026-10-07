#include <functional>
#include <iostream>
#include <string>
#include <vector>

template <typename T, typename Compare = std::less<T>>
void gnome_sort(std::vector<T>& a, Compare cmp = Compare{}) {
    std::size_t i = 0;
    while (i < a.size()) {
        if (i == 0 || !cmp(a[i], a[i - 1])) {
            ++i;
        } else {
            std::swap(a[i], a[i - 1]);
            --i;
        }
    }
}

int main() {
    std::vector<int> nums{34, 2, 10, -9, 7};
    gnome_sort(nums, std::greater<>{});
    for (int x : nums) std::cout << x << ' ';
    std::cout << '\n';
    std::vector<std::string> words{"delta", "alpha", "charlie", "bravo"};
    gnome_sort(words);
    for (const auto& w : words) std::cout << w << ' ';
    std::cout << '\n';
}
