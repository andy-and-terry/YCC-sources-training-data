#include <iostream>
#include <memory>
#include <string>
#include <utility>

struct Widget {
    Widget(int a, std::string b) { std::cout << a << b << "\n"; }
};

template <typename T, typename... Args>
std::unique_ptr<T> make(Args&&... args) { return std::make_unique<T>(std::forward<Args>(args)...); }

int main() { auto w = make<Widget>(3, std::string("x")); }
