#include <iostream>
int main() {
    int n = 0;
    auto inc = [n]() mutable { return ++n; };
    auto add = [](auto a, auto b) { return a + b; };
    std::cout << inc() << inc() << n << " " << add(1, 2) << add(1.5, 2.5) << "\n";
}
