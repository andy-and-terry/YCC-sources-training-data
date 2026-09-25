#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> v{0, 1, 0, 3, 12, 0, 7};
    // stable_partition keeps relative order of non-zeros
    std::stable_partition(v.begin(), v.end(), [](int x) { return x != 0; });
    for (int x : v) std::cout << x << ' ';
    std::cout << '\n';
    std::vector<int> w{0, 1, 0, 3, 12};
    auto it = std::remove(w.begin(), w.end(), 0);
    std::fill(it, w.end(), 0);
    for (int x : w) std::cout << x << ' ';
    std::cout << '\n';
}
