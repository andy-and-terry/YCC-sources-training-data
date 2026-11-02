#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 3, 4}, sq(4);
    std::transform(v.begin(), v.end(), sq.begin(), [](int x) { return x * x; });
    std::cout << std::accumulate(sq.begin(), sq.end(), 0) << "\n";
}
