#include <iostream>

template <class T>
struct Counted {
    static inline int live = 0;
    Counted() { ++live; }
    Counted(const Counted&) { ++live; }
    ~Counted() { --live; }
};

struct Widget : Counted<Widget> {};

int main() {
    Widget a, b;
    { Widget c; std::cout << Counted<Widget>::live << "\n"; }
    std::cout << Counted<Widget>::live << "\n";
}
