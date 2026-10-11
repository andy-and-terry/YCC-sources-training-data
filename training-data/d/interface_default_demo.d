import std.stdio;

interface Shape {
    double area();
    final string describe() {
        import std.format : format;
        return format("area=%.2f", area());
    }
}

class Circle : Shape {
    double r;
    this(double r) { this.r = r; }
    override double area() { return 3.14159265 * r * r; }
}

class Rect : Shape {
    double w, h;
    this(double w, double h) { this.w = w; this.h = h; }
    override double area() { return w * h; }
}

void main() {
    Shape[] shapes = [new Circle(1), new Rect(2, 3)];
    foreach (s; shapes) writeln(s.describe());
}
