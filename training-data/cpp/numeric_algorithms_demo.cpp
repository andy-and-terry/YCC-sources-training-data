#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> v(6);
    std::iota(v.begin(), v.end(), 1);  // 1..6

    std::cout << "sum: " << std::accumulate(v.begin(), v.end(), 0) << "\n";
    std::cout << "product: "
              << std::accumulate(v.begin(), v.end(), 1, std::multiplies<int>()) << "\n";

    std::vector<int> prefix(v.size());
    std::partial_sum(v.begin(), v.end(), prefix.begin());
    for (int x : prefix) std::cout << x << " ";
    std::cout << "\n";

    std::vector<int> diffs(v.size());
    std::adjacent_difference(prefix.begin(), prefix.end(), diffs.begin());
    for (int x : diffs) std::cout << x << " ";
    std::cout << "\n";

    std::vector<int> w{2, 2, 2, 2, 2, 2};
    std::cout << "dot: " << std::inner_product(v.begin(), v.end(), w.begin(), 0) << "\n";
    std::cout << "gcd/lcm: " << std::gcd(12, 18) << " " << std::lcm(4, 6) << "\n";
    return 0;
}
