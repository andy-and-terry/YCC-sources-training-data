#include <iostream>

int main() {
    int a = 1, b = 2;
    auto by_val = [a]() { return a; };
    auto by_ref = [&b]() { return ++b; };
    auto mutable_copy = [a]() mutable { return ++a; };
    a = 10;
    std::cout << by_val() << ' ' << by_ref() << ' ' << mutable_copy() << ' ' << a << ' ' << b << '\n';
}
