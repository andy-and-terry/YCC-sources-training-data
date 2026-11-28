#include <iostream>

template <class D> struct Shape {
    double area() const { return static_cast<const D*>(this)->area_impl(); }
};
struct Sq : Shape<Sq> {
    double s;
    explicit Sq(double s) : s(s) {}
    double area_impl() const { return s * s; }
};

int main() {
    Sq q(3);
    std::cout << q.area() << '\n';
}
