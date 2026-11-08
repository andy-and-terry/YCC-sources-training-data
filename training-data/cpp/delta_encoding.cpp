#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> xs{10, 12, 15, 15, 20}, d(xs.size()), back(xs.size());
    std::adjacent_difference(xs.begin(), xs.end(), d.begin());
    std::partial_sum(d.begin(), d.end(), back.begin());
    for (int v : d) std::cout << v << " ";
    std::cout << "| ";
    for (int v : back) std::cout << v << " ";
    std::cout << "\n";
}
