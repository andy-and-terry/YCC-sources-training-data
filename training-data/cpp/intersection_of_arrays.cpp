#include <algorithm>
#include <iostream>
#include <iterator>
#include <set>
#include <vector>

int main() {
    std::vector<int> a{4, 9, 5, 4, 4}, b{9, 4, 9, 8, 4};
    std::sort(a.begin(), a.end());
    std::sort(b.begin(), b.end());
    std::vector<int> multi;
    std::set_intersection(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(multi));
    std::set<int> unique(multi.begin(), multi.end());
    std::vector<int> uni, diff;
    std::set_union(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(uni));
    std::set_difference(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(diff));
    auto print = [](const char* label, const auto& c) {
        std::cout << label;
        for (int x : c) std::cout << ' ' << x;
        std::cout << '\n';
    };
    print("intersection (multiset):", multi);
    print("intersection (unique):", unique);
    print("union:", uni);
    print("a - b:", diff);
}
