#include <functional>
#include <iostream>
#include <vector>

int main() {
    int base = 10;
    int counter = 0;

    auto byValue = [base](int x) { return x + base; };
    auto byRef = [&counter](int x) { counter += x; };
    auto mutableCopy = [counter]() mutable { return ++counter; };
    auto initCapture = [offset = base * 2](int x) { return x + offset; };

    base = 99;  // does not affect byValue
    std::cout << byValue(5) << "\n";
    byRef(3);
    byRef(4);
    std::cout << "counter: " << counter << "\n";
    std::cout << mutableCopy() << " " << mutableCopy() << " (counter still " << counter << ")\n";
    std::cout << initCapture(1) << "\n";

    std::vector<std::function<int()>> makers;
    for (int i = 1; i <= 3; i++) {
        makers.push_back([i] { return i * i; });
    }
    for (auto& f : makers) std::cout << f() << " ";
    std::cout << "\n";
    return 0;
}
