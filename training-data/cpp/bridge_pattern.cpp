#include <iostream>

class Renderer {
public:
    virtual void renderCircle(float x, float y, float radius) = 0;
    virtual ~Renderer() = default;
};

class VectorRenderer : public Renderer {
public:
    void renderCircle(float x, float y, float radius) override {
        std::cout << "vector circle at (" << x << ", " << y << ") r=" << radius << std::endl;
    }
};

class RasterRenderer : public Renderer {
public:
    void renderCircle(float x, float y, float radius) override {
        std::cout << "raster circle at (" << x << ", " << y << ") r=" << radius << " (rasterized)" << std::endl;
    }
};

class Shape {
public:
    explicit Shape(Renderer& renderer) : renderer(renderer) {}
    virtual void draw() = 0;
    virtual ~Shape() = default;

protected:
    Renderer& renderer;
};

class Circle : public Shape {
public:
    Circle(Renderer& renderer, float x, float y, float radius)
        : Shape(renderer), x(x), y(y), radius(radius) {}

    void draw() override { renderer.renderCircle(x, y, radius); }
    void resize(float factor) { radius *= factor; }

private:
    float x, y, radius;
};

int main() {
    VectorRenderer vectorRenderer;
    RasterRenderer rasterRenderer;

    Circle vectorCircle(vectorRenderer, 1, 2, 5);
    Circle rasterCircle(rasterRenderer, 3, 4, 7);

    vectorCircle.draw();
    rasterCircle.draw();

    vectorCircle.resize(2);
    vectorCircle.draw();

    return 0;
}
