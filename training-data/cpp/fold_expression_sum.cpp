#include <iostream>

template <class... Ts> auto sum(Ts... xs) { return (xs + ... + 0); }
template <class... Ts> void print_all(Ts&&... xs) { ((std::cout << xs << ' '), ...); std::cout << '\n'; }

int main() {
    std::cout << sum(1, 2, 3, 4) << '\n';
    print_all("a", 1, 2.5);
}
