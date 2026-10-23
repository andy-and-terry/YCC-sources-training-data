#include <algorithm>
#include <functional>
#include <iostream>
#include <vector>

// std::adjacent_find returns the first position where two neighbouring
// elements satisfy a predicate (equality by default).
int main() {
    std::vector<int> v = {1, 2, 3, 3, 4, 5, 5, 5, 6};

    auto dup = std::adjacent_find(v.begin(), v.end());
    if (dup != v.end())
        std::cout << "first adjacent duplicate: " << *dup
                  << " at index " << (dup - v.begin()) << "\n";

    // Custom predicate: first pair where the sequence stops increasing.
    std::vector<int> w = {1, 4, 9, 16, 15, 30};
    auto drop = std::adjacent_find(w.begin(), w.end(), std::greater<int>());
    if (drop != w.end())
        std::cout << "sequence drops after " << *drop << " (next is "
                  << *(drop + 1) << ")\n";

    // Is the whole range sorted? No descent means adjacent_find hits the end.
    bool sorted = std::adjacent_find(v.begin(), v.end(), std::greater<int>()) == v.end();
    std::cout << "v sorted: " << std::boolalpha << sorted << "\n";

    // Collapse runs of equal values using the same idea via std::unique.
    v.erase(std::unique(v.begin(), v.end()), v.end());
    for (int x : v) std::cout << x << " ";
    std::cout << "\n";
}
