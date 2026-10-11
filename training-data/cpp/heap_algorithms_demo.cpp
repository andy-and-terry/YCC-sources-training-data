#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> v{3, 1, 4, 1, 5, 9, 2, 6};
    std::make_heap(v.begin(), v.end());
    std::cout << "max=" << v.front() << "\n";

    v.push_back(10);
    std::push_heap(v.begin(), v.end());
    std::cout << "after push max=" << v.front() << "\n";

    std::pop_heap(v.begin(), v.end());
    std::cout << "popped " << v.back() << "\n";
    v.pop_back();

    std::sort_heap(v.begin(), v.end());
    for (int x : v) std::cout << x << ' ';
    std::cout << "\n";

    std::vector<int> w{7, 2, 9, 4, 1, 8};
    std::partial_sort(w.begin(), w.begin() + 3, w.end());
    std::cout << "three smallest: " << w[0] << ' ' << w[1] << ' ' << w[2] << "\n";
}
