#include <iostream>
#include <memory>
#include <vector>

class Drawable {
public:
    template <typename T>
    Drawable(T value) : self(std::make_unique<Model<T>>(std::move(value))) {}

    void draw() const { self->draw(); }

private:
    struct Concept {
        virtual ~Concept() = default;
        virtual void draw() const = 0;
    };

    template <typename T>
    struct Model : Concept {
        explicit Model(T value) : data(std::move(value)) {}
        void draw() const override { data.draw(); }
        T data;
    };

    std::unique_ptr<Concept> self;
};

struct Circle {
    double radius;
    void draw() const { std::cout << "circle r=" << radius << std::endl; }
};

struct Square {
    double side;
    void draw() const { std::cout << "square s=" << side << std::endl; }
};

int main() {
    std::vector<Drawable> shapes;
    shapes.emplace_back(Circle{2.0});
    shapes.emplace_back(Square{3.0});

    for (const auto& shape : shapes) shape.draw();
    return 0;
}
