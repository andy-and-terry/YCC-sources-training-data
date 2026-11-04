#include <iostream>
#include <optional>
#include <set>
#include <vector>

std::optional<int> second_largest(const std::vector<int> &xs) {
    std::set<int, std::greater<>> distinct(xs.begin(), xs.end());
    if (distinct.size() < 2) return std::nullopt;
    return *std::next(distinct.begin());
}

int main() {
    std::cout << second_largest({4, 9, 2, 9, 7}).value_or(-1) << '\n';
    std::cout << second_largest({3, 3}).has_value() << '\n';
}
