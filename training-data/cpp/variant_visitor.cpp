#include <iostream>
#include <string>
#include <variant>
#include <vector>

struct Circle { double radius; };
struct Rectangle { double width, height; };
struct Triangle { double base, height; };

using Shape = std::variant<Circle, Rectangle, Triangle>;

double area(const Shape& shape) {
    return std::visit([](auto&& s) -> double {
        using T = std::decay_t<decltype(s)>;
        if constexpr (std::is_same_v<T, Circle>) return 3.14159265 * s.radius * s.radius;
        else if constexpr (std::is_same_v<T, Rectangle>) return s.width * s.height;
        else return 0.5 * s.base * s.height;
    }, shape);
}

int main() {
    std::vector<Shape> shapes = {Circle{2}, Rectangle{3, 4}, Triangle{5, 6}};
    for (auto& shape : shapes) std::cout << area(shape) << std::endl;
    return 0;
}
