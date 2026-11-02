import std.stdio;

interface Shape { double area(); }
class Sq : Shape { double s; this(double s) { this.s = s; } double area() { return s * s; } }
class Ci : Shape { double r; this(double r) { this.r = r; } double area() { return 3.14159 * r * r; } }

void main() {
    Shape[] shapes = [new Sq(2), new Ci(1)];
    foreach (s; shapes) writeln(s.area());
}
