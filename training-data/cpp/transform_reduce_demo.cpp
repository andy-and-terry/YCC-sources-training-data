#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<double> a{1, 2, 3}, b{4, 5, 6};
    double dot = std::transform_reduce(a.begin(), a.end(), b.begin(), 0.0);
    std::cout << "dot=" << dot << "\n";

    double sumsq = std::transform_reduce(a.begin(), a.end(), 0.0, std::plus<>(),
                                         [](double x) { return x * x; });
    std::cout << "sum of squares=" << sumsq << "\n";

    std::vector<int> v{1, 2, 3, 4, 5, 6};
    std::vector<int> scan(v.size());
    std::inclusive_scan(v.begin(), v.end(), scan.begin());
    for (int x : scan) std::cout << x << ' ';
    std::cout << "\n";
    std::exclusive_scan(v.begin(), v.end(), scan.begin(), 100);
    for (int x : scan) std::cout << x << ' ';
    std::cout << "\n";
}
