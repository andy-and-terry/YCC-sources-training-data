#include <iostream>

template <typename Derived>
struct Counted {
    static inline int count = 0;
    Counted() { ++count; }
    ~Counted() { --count; }
};

struct Widget : Counted<Widget> {};
struct Gadget : Counted<Gadget> {};

int main() {
    Widget a, b;
    { Gadget g; std::cout << Counted<Gadget>::count << "\n"; }
    std::cout << Counted<Widget>::count << " " << Counted<Gadget>::count << "\n";
}
