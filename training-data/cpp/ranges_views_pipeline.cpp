#include <iostream>
#include <ranges>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8};
    auto r = v | std::views::filter([](int n) { return n % 2 == 0; })
               | std::views::transform([](int n) { return n * n; })
               | std::views::take(3);
    for (int x : r) std::cout << x << " ";
    std::cout << "\n";
    for (int x : std::views::iota(1, 5) | std::views::reverse) std::cout << x;
    std::cout << "\n";
}
