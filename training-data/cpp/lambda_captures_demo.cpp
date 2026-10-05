#include <functional>
#include <iostream>
#include <vector>

std::function<int()> makeCounter(int start) {
    return [n = start]() mutable { return n++; };
}

int main() {
    int base = 10;
    auto byValue = [base](int x) { return x + base; };
    auto byRef = [&base](int x) { return x + base; };

    base = 20;
    std::cout << "by value: " << byValue(1) << std::endl;
    std::cout << "by ref: " << byRef(1) << std::endl;

    auto counter = makeCounter(5);
    std::cout << counter() << " " << counter() << " " << counter() << std::endl;

    std::vector<std::function<int(int)>> ops;
    for (int k = 1; k <= 3; ++k) {
        ops.push_back([k](int x) { return x * k; });
    }
    for (auto &op : ops) {
        std::cout << op(7) << " ";
    }
    std::cout << std::endl;
    return 0;
}
