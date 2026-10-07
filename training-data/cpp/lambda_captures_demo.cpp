#include <functional>
#include <iostream>
#include <vector>

int main() {
    int base = 10;
    auto byValue = [base](int x) { return x + base; };
    auto byRef = [&base](int x) { return x + base; };
    auto counter = [n = 0]() mutable { return ++n; };   // init-capture

    base = 100;
    std::cout << byValue(1) << " " << byRef(1) << "\n";   // 11 101
    std::cout << counter() << counter() << counter() << "\n";

    std::vector<std::function<int()>> fns;
    for (int i = 0; i < 3; ++i) fns.push_back([i] { return i * i; });
    for (auto& f : fns) std::cout << f() << " ";
    std::cout << "\n";
}
