#include <iostream>
#include <vector>

void odd_even_sort(std::vector<int>& a) {
    bool sorted = false;
    while (!sorted) {
        sorted = true;
        for (std::size_t start : {1u, 0u}) {
            for (std::size_t i = start; i + 1 < a.size(); i += 2) {
                if (a[i] > a[i + 1]) {
                    std::swap(a[i], a[i + 1]);
                    sorted = false;
                }
            }
        }
    }
}

int main() {
    std::vector<int> v{34, 2, 10, -9, 5, 3, 1};
    odd_even_sort(v);
    for (int x : v) std::cout << x << ' ';
    std::cout << '\n';
}
