#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> v(6);
    std::iota(v.begin(), v.end(), 1);
    std::cout << "sum=" << std::accumulate(v.begin(), v.end(), 0)
              << " product=" << std::accumulate(v.begin(), v.end(), 1, std::multiplies<>()) << "\n";
    std::vector<int> prefix(v.size());
    std::partial_sum(v.begin(), v.end(), prefix.begin());
    for (int x : prefix) std::cout << x << " ";
    std::cout << "\n";
    std::vector<int> w{2, 2, 2, 2, 2, 2};
    std::cout << "dot=" << std::inner_product(v.begin(), v.end(), w.begin(), 0) << "\n";
    std::vector<int> diff(v.size());
    std::adjacent_difference(prefix.begin(), prefix.end(), diff.begin());
    for (int x : diff) std::cout << x << " ";
    std::cout << "\ngcd=" << std::gcd(84, 36) << " lcm=" << std::lcm(4, 6) << "\n";
}
