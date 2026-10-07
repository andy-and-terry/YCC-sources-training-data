#include <forward_list>
#include <iostream>

int main() {
    std::forward_list<int> a{1, 2, 4, 9}, b{1, 3, 4, 5, 10};
    a.merge(b);  // splices nodes, no allocation, stable
    for (int x : a) std::cout << x << ' ';
    std::cout << "\nb empty after merge: " << std::boolalpha << b.empty() << '\n';

    std::forward_list<int> c{5, -1, 3, 8, 0, 2};
    c.sort();  // merge sort under the hood
    for (int x : c) std::cout << x << ' ';
    std::cout << '\n';
}
