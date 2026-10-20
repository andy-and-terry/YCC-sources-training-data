#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> v{5, 3, 8, 1, 9, 2};
    std::sort(v.begin(), v.end());
    auto it = std::lower_bound(v.begin(), v.end(), 5);
    std::cout << *it << " " << std::accumulate(v.begin(), v.end(), 0) << "\n";
    std::vector<int> p(v.size());
    std::partial_sum(v.begin(), v.end(), p.begin());
    for (int x : p) std::cout << x << " ";
    std::cout << "\n" << std::count_if(v.begin(), v.end(), [](int n) { return n > 4; }) << "\n";
    std::rotate(v.begin(), v.begin() + 2, v.end());
    std::cout << v.front() << std::gcd(12, 18) << std::lcm(4, 6) << "\n";
}
