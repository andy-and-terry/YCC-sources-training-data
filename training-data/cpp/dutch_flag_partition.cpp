#include <algorithm>
#include <iostream>
#include <vector>

// Three-way partition generalised to any predicate pair, as used by 3-way quicksort.
template <typename It, typename T>
std::pair<It, It> partition3(It first, It last, const T& pivot) {
    It lt = first, i = first, gt = last;
    while (i != gt) {
        if (*i < pivot) std::iter_swap(lt++, i++);
        else if (pivot < *i) std::iter_swap(i, --gt);
        else ++i;
    }
    return {lt, gt};
}

template <typename It>
void quicksort3(It first, It last) {
    if (std::distance(first, last) < 2) return;
    auto pivot = *std::next(first, std::distance(first, last) / 2);
    auto [lt, gt] = partition3(first, last, pivot);
    quicksort3(first, lt);
    quicksort3(gt, last);
}

int main() {
    std::vector<int> flags{2, 0, 2, 1, 1, 0, 1, 2, 0};
    auto [lt, gt] = partition3(flags.begin(), flags.end(), 1);
    for (int x : flags) std::cout << x << ' ';
    std::cout << "(ones at " << (lt - flags.begin()) << ".." << (gt - flags.begin()) << ")\n";
    std::vector<int> v{5, 3, 5, 1, 5, 2, 5, 9, 0, 5};
    quicksort3(v.begin(), v.end());
    for (int x : v) std::cout << x << ' ';
    std::cout << '\n';
}
