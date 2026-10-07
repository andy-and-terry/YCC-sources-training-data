#include <iostream>
#include <vector>

template <typename T>
void comb_sort(std::vector<T>& a) {
    std::size_t gap = a.size();
    bool sorted = false;
    while (!sorted) {
        gap = static_cast<std::size_t>(gap / 1.3);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (std::size_t i = 0; i + gap < a.size(); ++i) {
            if (a[i + gap] < a[i]) {
                std::swap(a[i], a[i + gap]);
                sorted = false;
            }
        }
    }
}

int main() {
    std::vector<int> v{8, 4, 1, 56, 3, -44, 23, -6, 28, 0};
    comb_sort(v);
    for (int x : v) std::cout << x << ' ';
    std::cout << '\n';
}
