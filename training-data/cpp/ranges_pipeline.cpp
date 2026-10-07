#include <iostream>
#include <ranges>
#include <vector>

int main() {
    std::vector<int> numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    auto evenSquares = numbers
        | std::views::filter([](int n) { return n % 2 == 0; })
        | std::views::transform([](int n) { return n * n; });

    for (int n : evenSquares) std::cout << n << " ";
    std::cout << std::endl;

    auto firstThree = numbers | std::views::take(3);
    for (int n : firstThree) std::cout << n << " ";
    std::cout << std::endl;

    return 0;
}
