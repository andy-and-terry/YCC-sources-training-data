#include <iostream>

template <typename T>
struct Counted {
    static inline int count = 0;
    Counted() { ++count; }
    Counted(const Counted&) { ++count; }
    ~Counted() { --count; }
};

struct Widget : Counted<Widget> {};
struct Gadget : Counted<Gadget> {};

int main() {
    Widget a, b;
    {
        Gadget g;
        std::cout << Widget::count << " " << Gadget::count << "\n";
    }
    std::cout << Widget::count << " " << Gadget::count << "\n";
}
