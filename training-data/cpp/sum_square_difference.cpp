// Square of the sum minus sum of squares for 1..10 (expect 2640)
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> xs(10);
    std::iota(xs.begin(), xs.end(), 1);
    int sum = std::accumulate(xs.begin(), xs.end(), 0);
    int squares = std::inner_product(xs.begin(), xs.end(), xs.begin(), 0);
    std::cout << sum * sum - squares << '\n';
}
