#include <iostream>
#include <numeric>
#include <span>
#include <vector>

double average(std::span<const int> xs) {
    return xs.empty() ? 0.0 : std::accumulate(xs.begin(), xs.end(), 0.0) / xs.size();
}

void scale(std::span<int> xs, int factor) {
    for (int& x : xs) x *= factor;
}

int main() {
    std::vector<int> v{1, 2, 3, 4, 5, 6};
    int arr[] = {10, 20, 30};
    std::cout << average(v) << ' ' << average(arr) << '\n';
    scale(std::span(v).subspan(2, 3), 10);
    for (int x : v) std::cout << x << ' ';
    std::cout << '\n';
}
