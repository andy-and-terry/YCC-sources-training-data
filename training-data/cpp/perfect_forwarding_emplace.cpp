#include <iostream>
#include <string>
#include <utility>
#include <vector>

struct Widget {
    std::string name;
    int id;
    Widget(std::string n, int i) : name(std::move(n)), id(i) { std::cout << "ctor " << name << '\n'; }
    Widget(Widget&&) noexcept { std::cout << "move\n"; }
};

template <class T, class... Args>
T make(Args&&... args) { return T(std::forward<Args>(args)...); }

int main() {
    std::vector<Widget> v;
    v.reserve(2);
    v.emplace_back("a", 1);
    Widget w = make<Widget>(std::string("b"), 2);
    std::cout << w.id << '\n';
}
