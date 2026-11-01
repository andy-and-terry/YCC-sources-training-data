#include <iostream>
#include <ranges>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8};
    auto r = v | std::views::filter([](int x) { return x % 2 == 0; })
               | std::views::transform([](int x) { return x * x; });
    for (int x : r) std::cout << x << " ";
    std::cout << "\n";
}
