#include <functional>
#include <iostream>

int main() {
    int base = 10;
    auto by_value = [base](int x) { return x + base; };
    auto by_ref = [&base](int x) { return x + base; };
    auto counter = [n = 0]() mutable { return ++n; };
    base = 100;
    std::cout << by_value(1) << " " << by_ref(1) << "\n";
    std::cout << counter() << counter() << counter() << "\n";

    auto make_adder = [](int k) { return [k](int x) { return x + k; }; };
    std::cout << make_adder(5)(7) << "\n";

    auto generic = [](auto a, auto b) { return a + b; };
    std::cout << generic(1, 2) << " " << generic(1.5, 2.25) << "\n";
}
