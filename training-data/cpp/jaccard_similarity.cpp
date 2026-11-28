#include <algorithm>
#include <iostream>
#include <iterator>
#include <set>
#include <vector>

double jaccard(const std::set<int>& a, const std::set<int>& b) {
    std::vector<int> i, u;
    std::set_intersection(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(i));
    std::set_union(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(u));
    return u.empty() ? 1.0 : double(i.size()) / u.size();
}

int main() { std::cout << jaccard({1, 2, 3, 4}, {3, 4, 5}) << "\n"; }
