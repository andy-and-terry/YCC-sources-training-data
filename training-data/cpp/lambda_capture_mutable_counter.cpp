#include <iostream>
#include <functional>

int main() {
    int n = 0;
    auto inc = [n]() mutable { return ++n; };
    std::cout << inc() << inc() << inc() << " outer=" << n << "\n";
    std::function<int(int)> fib = [&](int k) { return k < 2 ? k : fib(k - 1) + fib(k - 2); };
    std::cout << fib(10) << "\n";
}
