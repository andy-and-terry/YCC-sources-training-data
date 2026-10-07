#include <iostream>
#include <utility>
#include <vector>

template <typename It>
void cocktail_shaker_sort(It first, It last) {
    if (first == last) return;
    bool swapped = true;
    --last;
    while (swapped) {
        swapped = false;
        for (It i = first; i != last; ++i) {
            if (*std::next(i) < *i) {
                std::iter_swap(i, std::next(i));
                swapped = true;
            }
        }
        --last;
        for (It i = last; i != first; --i) {
            if (*i < *std::prev(i)) {
                std::iter_swap(i, std::prev(i));
                swapped = true;
            }
        }
        ++first;
    }
}

int main() {
    std::vector<int> v{5, 1, 4, 2, 8, 0, 2};
    cocktail_shaker_sort(v.begin(), v.end());
    for (int x : v) std::cout << x << ' ';
    std::cout << '\n';
}
