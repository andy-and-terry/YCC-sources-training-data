import std.stdio;
import std.math : PI;

interface Shape {
    double area();
}

class CircleShape : Shape {
    private double radius;
    this(double radius) { this.radius = radius; }
    double area() { return PI * radius * radius; }
}

class SquareShape : Shape {
    private double side;
    this(double side) { this.side = side; }
    double area() { return side * side; }
}

Shape shapeFactory(string kind, double param) {
    switch (kind) {
        case "circle": return new CircleShape(param);
        case "square": return new SquareShape(param);
        default: throw new Exception("unknown shape: " ~ kind);
    }
}

void main() {
    writeln(shapeFactory("circle", 2.0).area());
    writeln(shapeFactory("square", 3.0).area());
}
