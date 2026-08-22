#include <cmath>
#include <iostream>
#include <memory>
#include <stdexcept>

class Shape {
public:
    virtual double area() const = 0;
    virtual ~Shape() = default;
};

class Circle : public Shape {
public:
    explicit Circle(double radius) : radius(radius) {}
    double area() const override { return M_PI * radius * radius; }

private:
    double radius;
};

class Square : public Shape {
public:
    explicit Square(double side) : side(side) {}
    double area() const override { return side * side; }

private:
    double side;
};

std::unique_ptr<Shape> shapeFactory(const std::string& kind, double param) {
    if (kind == "circle") return std::make_unique<Circle>(param);
    if (kind == "square") return std::make_unique<Square>(param);
    throw std::invalid_argument("unknown shape: " + kind);
}

int main() {
    std::cout << shapeFactory("circle", 2)->area() << std::endl;
    std::cout << shapeFactory("square", 3)->area() << std::endl;
    return 0;
}
