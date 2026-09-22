#include <iostream>
#include <memory>
#include <vector>

class Shape {
public:
    virtual std::unique_ptr<Shape> clone() const = 0;
    virtual void draw() const = 0;
    virtual ~Shape() = default;
};

class Circle : public Shape {
public:
    explicit Circle(int radius) : radius_(radius) {}

    std::unique_ptr<Shape> clone() const override { return std::make_unique<Circle>(*this); }
    void draw() const override { std::cout << "Circle(r=" << radius_ << ")" << std::endl; }

private:
    int radius_;
};

class Square : public Shape {
public:
    explicit Square(int side) : side_(side) {}

    std::unique_ptr<Shape> clone() const override { return std::make_unique<Square>(*this); }
    void draw() const override { std::cout << "Square(s=" << side_ << ")" << std::endl; }

private:
    int side_;
};

int main() {
    std::vector<std::unique_ptr<Shape>> prototypes;
    prototypes.push_back(std::make_unique<Circle>(5));
    prototypes.push_back(std::make_unique<Square>(3));

    std::vector<std::unique_ptr<Shape>> clones;
    for (const auto& proto : prototypes) {
        clones.push_back(proto->clone());
    }

    for (const auto& shape : clones) {
        shape->draw();
    }
    return 0;
}
