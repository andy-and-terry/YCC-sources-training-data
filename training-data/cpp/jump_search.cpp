#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>

template <typename T>
long jump_search(const std::vector<T>& a, const T& target) {
    const std::size_t n = a.size();
    const std::size_t step = std::max<std::size_t>(1, static_cast<std::size_t>(std::sqrt(n)));
    std::size_t prev = 0;
    while (prev < n && a[std::min(prev + step, n) - 1] < target) prev += step;
    for (std::size_t i = prev; i < std::min(prev + step, n); ++i)
        if (a[i] == target) return static_cast<long>(i);
    return -1;
}

int main() {
    std::vector<int> fib{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610};
    std::cout << jump_search(fib, 55) << ' ' << jump_search(fib, 4) << '\n';
}
