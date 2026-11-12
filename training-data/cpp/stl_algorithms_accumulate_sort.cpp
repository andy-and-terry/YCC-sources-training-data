#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>
int main() {
    std::vector<int> v{5, 2, 9, 1};
    std::sort(v.begin(), v.end(), std::greater<>());
    std::cout << std::accumulate(v.begin(), v.end(), 0) << " " << v[0] << "\n";
    std::cout << *std::min_element(v.begin(), v.end()) << std::count_if(v.begin(), v.end(), [](int x) { return x > 2; }) << "\n";
}
