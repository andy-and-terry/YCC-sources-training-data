#include <iostream>
#include <set>

int main() {
    std::set<int> s{10, 20, 30, 40, 50};
    auto lb = s.lower_bound(25);
    auto ub = s.upper_bound(30);
    std::cout << "lower_bound(25)=" << *lb << " upper_bound(30)=" << *ub << "\n";

    auto it = s.lower_bound(60);
    std::cout << (it == s.end() ? "no element >= 60" : "found") << "\n";

    // predecessor: largest element < 30
    auto p = s.lower_bound(30);
    if (p != s.begin()) std::cout << "predecessor of 30 = " << *std::prev(p) << "\n";

    for (auto i = s.lower_bound(20); i != s.upper_bound(40); ++i) std::cout << *i << ' ';
    std::cout << "\n";
}
