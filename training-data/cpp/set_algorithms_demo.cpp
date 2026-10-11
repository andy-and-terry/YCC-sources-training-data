#include <algorithm>
#include <iostream>
#include <iterator>
#include <vector>

void show(const char* label, const std::vector<int>& v) {
    std::cout << label << ":";
    for (int x : v) std::cout << ' ' << x;
    std::cout << "\n";
}

int main() {
    std::vector<int> a{1, 2, 3, 5, 8}, b{2, 3, 4, 8, 9};
    std::vector<int> r;
    std::set_union(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(r));
    show("union", r); r.clear();
    std::set_intersection(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(r));
    show("intersection", r); r.clear();
    std::set_difference(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(r));
    show("difference", r); r.clear();
    std::set_symmetric_difference(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(r));
    show("symmetric", r);
    std::cout << "includes {2,3}: " << std::includes(a.begin(), a.end(), b.begin(), b.begin() + 2) << "\n";
}
