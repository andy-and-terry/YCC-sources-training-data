#include <iostream>
#include <optional>
#include <vector>
std::optional<int> first_even(const std::vector<int> &v) {
    for (int x : v) if (x % 2 == 0) return x;
    return std::nullopt;
}
int main() {
    std::cout << first_even({1, 3, 4}).value_or(-1) << "\n";
    std::cout << first_even({1, 3}).value_or(-1) << "\n";
}
