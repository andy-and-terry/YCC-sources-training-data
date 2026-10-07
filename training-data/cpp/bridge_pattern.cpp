#include <iostream>
#include <memory>

class Renderer {
public:
    virtual void renderCircle(double radius) const = 0;
    virtual ~Renderer() = default;
};

class VectorRenderer : public Renderer {
public:
    void renderCircle(double radius) const override {
        std::cout << "drawing vector circle of radius " << radius << std::endl;
    }
};

class RasterRenderer : public Renderer {
public:
    void renderCircle(double radius) const override {
        std::cout << "rasterizing circle of radius " << radius << " into pixels" << std::endl;
    }
};

class Shape {
public:
    explicit Shape(std::shared_ptr<Renderer> renderer) : renderer(std::move(renderer)) {}
    virtual void draw() const = 0;
    virtual void resize(double factor) = 0;
    virtual ~Shape() = default;

protected:
    std::shared_ptr<Renderer> renderer;
};

class Circle : public Shape {
public:
    Circle(std::shared_ptr<Renderer> renderer, double radius)
        : Shape(std::move(renderer)), radius(radius) {}

    void draw() const override { renderer->renderCircle(radius); }
    void resize(double factor) override { radius *= factor; }

private:
    double radius;
};

int main() {
    auto vectorRenderer = std::make_shared<VectorRenderer>();
    auto rasterRenderer = std::make_shared<RasterRenderer>();

    Circle vectorCircle(vectorRenderer, 5.0);
    Circle rasterCircle(rasterRenderer, 5.0);

    vectorCircle.draw();
    rasterCircle.draw();

    vectorCircle.resize(2.0);
    vectorCircle.draw();

    return 0;
}
