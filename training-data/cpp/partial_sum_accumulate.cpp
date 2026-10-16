#include <functional>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 3, 4, 5};
    std::cout << "sum=" << std::accumulate(v.begin(), v.end(), 0) << "\n";
    std::cout << "product=" << std::accumulate(v.begin(), v.end(), 1, std::multiplies<>()) << "\n";

    std::vector<int> running(v.size());
    std::partial_sum(v.begin(), v.end(), running.begin());
    for (int x : running) std::cout << x << ' ';
    std::cout << "\n";

    std::vector<int> diff(v.size());
    std::adjacent_difference(running.begin(), running.end(), diff.begin());
    for (int x : diff) std::cout << x << ' ';
    std::cout << "\n";

    std::string joined = std::accumulate(v.begin() + 1, v.end(), std::to_string(v[0]),
        [](std::string acc, int x) { return acc + "-" + std::to_string(x); });
    std::cout << joined << "\n";
}
