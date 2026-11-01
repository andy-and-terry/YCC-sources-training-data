import std.stdio;

interface Shape { double area(); }
class Circle : Shape {
    double r;
    this(double r) { this.r = r; }
    override double area() { return 3.14159 * r * r; }
}
class Sq : Shape {
    double s;
    this(double s) { this.s = s; }
    override double area() { return s * s; }
}

void main() {
    Shape[] shapes = [new Circle(1), new Sq(2)];
    foreach (s; shapes) writeln(s.area());
}
