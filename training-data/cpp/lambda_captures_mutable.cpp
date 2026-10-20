#include <functional>
#include <iostream>

int main() {
    int a = 1, b = 10;
    auto byval = [a]() mutable { return ++a; };
    auto byref = [&b] { return ++b; };
    auto gen = [n = 0]() mutable { return n++; };
    std::cout << byval() << byval() << " " << a << " " << byref() << b << "\n";
    gen(); gen();
    std::cout << gen() << "\n";
    std::function<int(int)> fact = [&](int n) { return n <= 1 ? 1 : n * fact(n - 1); };
    std::cout << fact(6) << "\n";
}
