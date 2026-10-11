#include <iostream>
#include <string>
#include <vector>

int main() {
    auto add = [](auto a, auto b) { return a + b; };
    std::cout << add(2, 3) << " " << add(1.5, 2.25) << " " << add(std::string("ab"), std::string("cd")) << "\n";

    auto print_all = [](const auto&... xs) { ((std::cout << xs << ' '), ...); std::cout << "\n"; };
    print_all(1, "two", 3.0, 'c');

    auto fact = [](auto self, int n) -> long long { return n <= 1 ? 1 : n * self(self, n - 1); };
    std::cout << fact(fact, 10) << "\n";

    auto counter = [n = 0]() mutable { return ++n; };
    counter(); counter();
    std::cout << "counter=" << counter() << "\n";
}
