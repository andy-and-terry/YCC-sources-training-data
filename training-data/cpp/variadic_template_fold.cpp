#include <iostream>
#include <string>

// Variadic templates with C++17 fold expressions.
template <typename... Ts>
auto sum(Ts... xs) { return (xs + ...); }

template <typename... Ts>
void printAll(const Ts&... xs) { ((std::cout << xs << ' '), ...); std::cout << '\n'; }

template <typename... Ts>
bool allPositive(Ts... xs) { return ((xs > 0) && ...); }

int main() {
    std::cout << sum(1, 2, 3, 4) << "\n";
    printAll("n=", 5, std::string("ok"), 2.5);
    std::cout << std::boolalpha << allPositive(1, 2, 3) << allPositive(1, -2) << "\n";
}
