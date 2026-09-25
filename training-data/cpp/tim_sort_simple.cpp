#include <algorithm>
#include <iostream>
#include <random>
#include <vector>

template <typename T>
void tim_sort(std::vector<T>& a, std::size_t min_run = 32) {
    const std::size_t n = a.size();
    for (std::size_t lo = 0; lo < n; lo += min_run) {
        auto hi = std::min(lo + min_run, n);
        for (std::size_t i = lo + 1; i < hi; ++i) {
            // binary insertion keeps it stable
            auto pos = std::upper_bound(a.begin() + static_cast<long>(lo), a.begin() + static_cast<long>(i), a[i]);
            std::rotate(pos, a.begin() + static_cast<long>(i), a.begin() + static_cast<long>(i) + 1);
        }
    }
    for (std::size_t size = min_run; size < n; size *= 2) {
        for (std::size_t lo = 0; lo + size < n; lo += 2 * size) {
            auto mid = a.begin() + static_cast<long>(lo + size);
            auto hi = a.begin() + static_cast<long>(std::min(lo + 2 * size, n));
            std::inplace_merge(a.begin() + static_cast<long>(lo), mid, hi);
        }
    }
}

int main() {
    std::mt19937 rng(42);
    std::uniform_int_distribution<int> dist(0, 9999);
    std::vector<int> v(2000);
    for (auto& x : v) x = dist(rng);
    auto expected = v;
    std::sort(expected.begin(), expected.end());
    tim_sort(v);
    std::cout << "matches std::sort: " << std::boolalpha << (v == expected) << '\n';
}
