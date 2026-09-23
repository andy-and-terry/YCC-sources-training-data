import std.stdio;

interface Shape {
    double area();
}

class Circle : Shape {
    private double radius;
    this(double radius) { this.radius = radius; }
    double area() { return 3.14159 * radius * radius; }
}

class LegacyRectangle {
    private double width, height;
    this(double width, double height) { this.width = width; this.height = height; }
    double legacyArea() { return width * height; }
}

class RectangleAdapter : Shape {
    private LegacyRectangle legacy;
    this(LegacyRectangle legacy) { this.legacy = legacy; }
    double area() { return legacy.legacyArea(); }
}

void main() {
    Shape[] shapes = [new Circle(2.0), new RectangleAdapter(new LegacyRectangle(3.0, 4.0))];
    foreach (shape; shapes) {
        writeln(shape.area());
    }
}
