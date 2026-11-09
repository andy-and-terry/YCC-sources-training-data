#include <iostream>

template <class... Args>
auto sum(Args... args) { return (args + ...); }

template <class... Args>
void print_all(Args... args) { ((std::cout << args << " "), ...); std::cout << "\n"; }

int main() {
    std::cout << sum(1, 2, 3, 4) << "\n";
    print_all("a", 1, 2.5);
}
