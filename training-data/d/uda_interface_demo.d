import std.stdio;

interface Shape {
    double area();
}

class Circle : Shape {
    double radius;
    this(double r) { radius = r; }
    double area() { return 3.14159 * radius * radius; }
}

class Rectangle : Shape {
    double width, height;
    this(double w, double h) { width = w; height = h; }
    double area() { return width * height; }
}

void main() {
    Shape[] shapes = [new Circle(2.0), new Rectangle(3.0, 4.0)];
    foreach (s; shapes) {
        writeln(s.area());
    }
}
