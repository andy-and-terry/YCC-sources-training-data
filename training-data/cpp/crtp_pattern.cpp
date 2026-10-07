#include <iostream>

template <typename Derived>
class Shape {
public:
    double area() const {
        return static_cast<const Derived*>(this)->computeArea();
    }
    void describe() const {
        std::cout << "area: " << area() << std::endl;
    }
};

class Circle : public Shape<Circle> {
public:
    explicit Circle(double r) : radius(r) {}
    double computeArea() const { return 3.14159 * radius * radius; }

private:
    double radius;
};

class Square : public Shape<Square> {
public:
    explicit Square(double s) : side(s) {}
    double computeArea() const { return side * side; }

private:
    double side;
};

template <typename Derived>
void report(const Shape<Derived>& shape) {
    shape.describe();
}

int main() {
    Circle circle(2.0);
    Square square(3.0);
    report(circle);
    report(square);
    return 0;
}
