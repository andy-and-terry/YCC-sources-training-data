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
    explicit Circle(double radius) : radius(radius) {}
    double computeArea() const { return 3.14159265 * radius * radius; }

private:
    double radius;
};

class Square : public Shape<Square> {
public:
    explicit Square(double side) : side(side) {}
    double computeArea() const { return side * side; }

private:
    double side;
};

template <typename T>
void report(const Shape<T>& shape) {
    shape.describe();
}

int main() {
    Circle c(2.0);
    Square s(3.0);
    report(c);
    report(s);
    return 0;
}
