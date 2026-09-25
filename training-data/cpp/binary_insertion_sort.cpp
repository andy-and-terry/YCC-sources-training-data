#include <algorithm>
#include <iostream>
#include <vector>

template <typename It>
void binary_insertion_sort(It first, It last) {
    for (It i = first; i != last; ++i) {
        std::rotate(std::upper_bound(first, i, *i), i, std::next(i));
    }
}

int main() {
    std::vector<int> v{37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54};
    binary_insertion_sort(v.begin(), v.end());
    for (int x : v) std::cout << x << ' ';
    std::cout << '\n';
}
