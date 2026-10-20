#include <iostream>

template <typename... Ts> void print(const Ts&... xs) { ((std::cout << xs << ' '), ...); std::cout << '\n'; }
template <typename... Ts> auto sum(Ts... xs) { return (xs + ...); }
template <typename... Ts> bool all(Ts... xs) { return (... && xs); }

int main() { print(1, "a", 2.5); std::cout << sum(1, 2, 3) << all(true, false) << "\n"; }
