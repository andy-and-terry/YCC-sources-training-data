#include <iostream>
#include <memory>
#include <string>
#include <utility>

struct Widget {
    std::string name;
    int size;
    Widget(std::string n, int s) : name(std::move(n)), size(s) {}
};

void inspect(const std::string &) { std::cout << "lvalue" << std::endl; }
void inspect(std::string &&) { std::cout << "rvalue" << std::endl; }

template <typename T>
void relay(T &&arg) {
    inspect(std::forward<T>(arg));
}

template <typename T, typename... Args>
std::unique_ptr<T> make(Args &&...args) {
    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
}

int main() {
    std::string s = "hello";
    relay(s);
    relay(std::string("temp"));
    relay(std::move(s));

    auto w = make<Widget>("gadget", 42);
    std::cout << w->name << " " << w->size << std::endl;
    return 0;
}
